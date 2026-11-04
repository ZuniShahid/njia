// App-wide Riverpod providers: Firebase handles, auth state, repositories, current user data.
// Previews and tests override the service/repository providers (lib/preview/fakes.dart).
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/engine/engine.dart';
import '../core/engine/finance_model.dart';
import '../core/engine/readiness_model.dart';
import '../core/engine/roadmap_model.dart';
import '../core/models/models.dart';
import '../data/auth_service.dart';
import '../data/content_repository.dart';
import '../data/jobs_repository.dart';
import '../data/plan_service.dart';
import '../data/user_repository.dart';

/// Set by main() – false while Firebase could not be initialised.
final firebaseReadyProvider = Provider<bool>((_) => false);

final firestoreProvider = Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);

final authServiceProvider = Provider<AuthService>((ref) => FirebaseAuthService(FirebaseAuth.instance));
final userRepositoryProvider = Provider<UserRepository>((ref) => FirestoreUserRepository(ref.watch(firestoreProvider)));
final contentRepositoryProvider = Provider<ContentRepository>((ref) => FirestoreContentRepository(ref.watch(firestoreProvider)));
final jobsRepositoryProvider = Provider<JobsRepository>((ref) => JobsRepository(ref.watch(firestoreProvider)));
final planServiceProvider = Provider<PlanService>((ref) => FirebasePlanService(FirebaseFunctions.instanceFor(region: 'europe-west1')));

final authUserProvider = StreamProvider<AuthUser?>((ref) {
  if (!ref.watch(firebaseReadyProvider)) return Stream.value(null);
  return ref.watch(authServiceProvider).authStateChanges();
});

/// null = still loading, false = signed out, true = signed in. Used by the router redirect.
final isSignedInProvider = Provider<bool?>((ref) {
  final auth = ref.watch(authUserProvider);
  return auth.when(data: (u) => u != null, loading: () => null, error: (_, _) => false);
});

final currentUidProvider = Provider<String?>((ref) => ref.watch(authUserProvider).value?.uid);

final profileProvider = StreamProvider<UserProfile?>((ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream.value(null);
  return ref.watch(userRepositoryProvider).profile(uid);
});

final goalsProvider = StreamProvider<List<Goal>>((ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream.value(const []);
  return ref.watch(userRepositoryProvider).goals(uid);
});

/// The goal the cockpit follows: users/{uid}.activeGoalId, else the first goal.
final activeGoalProvider = Provider<Goal?>((ref) {
  final goals = ref.watch(goalsProvider).value ?? const [];
  if (goals.isEmpty) return null;
  final id = ref.watch(profileProvider).value?.activeGoalId;
  return goals.where((g) => g.id == id).firstOrNull ?? goals.first;
});

final countriesProvider = FutureProvider<List<Country>>((ref) => ref.watch(contentRepositoryProvider).countries());
final occupationsProvider = FutureProvider<List<Occupation>>((ref) => ref.watch(contentRepositoryProvider).occupations());

/// sources/{id}.name for provenance chips, keyed by id.
final sourceNamesProvider = FutureProvider<Map<String, String>>((ref) async {
  final list = await ref.watch(contentRepositoryProvider).sources();
  return {for (final s in list) s.id: s.name};
});

/// Max goals per user (prototype: "Up to 5 goals").
const maxGoals = 5;

// ---- plan & roadmap -------------------------------------------------------------------------------

/// The canonical server plan for a goal (null until computePlan has run or while offline before the first sync).
final serverPlanProvider = StreamProvider.family<Plan?, String>((ref, goalId) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream.value(null);
  return ref.watch(userRepositoryProvider).plan(uid, goalId);
});

/// Content for one destination country (origin SL), cached per country for the session.
final corridorBundleProvider = FutureProvider.family<ContentBundle, String>(
  (ref, countryId) => ref.watch(contentRepositoryProvider).corridorBundle(destination: countryId),
);

/// Server plan if present, otherwise the Dart engine's instant preview from the same inputs.
final effectivePlanProvider = FutureProvider.family<Plan?, String>((ref, goalId) async {
  final goal = (ref.watch(goalsProvider).value ?? const <Goal>[]).where((g) => g.id == goalId).firstOrNull;
  if (goal == null) return null;
  final server = ref.watch(serverPlanProvider(goalId)).value;
  if (server != null) return server;
  final profile = ref.watch(profileProvider).value;
  final countryId = goal.countryId;
  if (profile == null || countryId == null) return null;
  final content = await ref.watch(corridorBundleProvider(countryId).future);
  final facts = factsFromProfile(profile);
  return buildPlan(goal: goal, profile: profile.copyWith(facts: facts), content: content);
});

/// Everything the cockpit and roadmap render, for the active goal.
final roadmapProvider = FutureProvider<RoadmapModel?>((ref) async {
  final goal = ref.watch(activeGoalProvider);
  if (goal?.id == null || goal!.countryId == null) return null;
  final plan = await ref.watch(effectivePlanProvider(goal.id!).future);
  if (plan == null) return null;
  final content = await ref.watch(corridorBundleProvider(goal.countryId!).future);
  final progress = ref.watch(profileProvider).value?.progress?[goal.id] as Map?;
  return RoadmapModel.build(goal: goal, plan: plan, content: content, progress: progress == null ? null : Map<String, dynamic>.from(progress));
});

/// Writes one progress value for the active goal: users/{uid}.progress[goalId][section][key] = value.
Future<void> saveProgress(WidgetRef ref, {required String goalId, required String section, required String key, required Object? value}) async {
  final uid = ref.read(currentUidProvider);
  final profile = ref.read(profileProvider).value;
  if (uid == null) return;
  final all = Map<String, dynamic>.from(profile?.progress ?? const {});
  final goalMap = Map<String, dynamic>.from(all[goalId] as Map? ?? const {});
  final sectionMap = Map<String, dynamic>.from(goalMap[section] as Map? ?? const {});
  if (value == null) {
    sectionMap.remove(key);
  } else {
    sectionMap[key] = value;
  }
  goalMap[section] = sectionMap;
  all[goalId] = goalMap;
  await ref.read(userRepositoryProvider).updateProfile(uid, {'progress': all});
}

/// Readiness for the active goal, recomputed locally from profile facts (instant feedback).
final readinessProvider = FutureProvider<ReadinessModel?>((ref) async {
  final goal = ref.watch(activeGoalProvider);
  final profile = ref.watch(profileProvider).value;
  if (goal?.countryId == null || profile == null) return null;
  final content = await ref.watch(corridorBundleProvider(goal!.countryId!).future);
  return ReadinessModel.build(goal: goal, profile: profile, content: content);
});

/// Finances for the active goal (costs from the plan, funds from profile + progress).
final financeProvider = FutureProvider<FinanceModel?>((ref) async {
  final roadmap = await ref.watch(roadmapProvider.future);
  final profile = ref.watch(profileProvider).value;
  if (roadmap == null || profile == null) return null;
  return FinanceModel.build(roadmap: roadmap, profile: profile);
});

final trustAlertsProvider = FutureProvider.family<List<TrustAlert>, String>((ref, countryId) => ref.watch(contentRepositoryProvider).trustAlerts(countryId));

/// Ticks a requirement on the readiness screen: writes the satisfying fact, asks the server to recompute.
Future<void> setRequirementMet(WidgetRef ref, {required Requirement requirement, required bool met}) async {
  final uid = ref.read(currentUidProvider);
  final key = requirement.key;
  if (uid == null || key == null) return;
  final value = met ? ReadinessModel.satisfyingValue(requirement) : null;
  await ref.read(userRepositoryProvider).setFact(uid, key, value);
  final goalId = ref.read(activeGoalProvider)?.id;
  if (goalId != null) await ref.read(planServiceProvider).recompute(goalId);
}
