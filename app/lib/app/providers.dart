// App-wide Riverpod providers: Firebase handles, auth state, repositories, current user data.
// Previews and tests override the service/repository providers (lib/preview/fakes.dart).
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/models.dart';
import '../data/auth_service.dart';
import '../data/content_repository.dart';
import '../data/jobs_repository.dart';
import '../data/user_repository.dart';

/// Set by main() – false while Firebase could not be initialised.
final firebaseReadyProvider = Provider<bool>((_) => false);

final firestoreProvider = Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);

final authServiceProvider = Provider<AuthService>((ref) => FirebaseAuthService(FirebaseAuth.instance));
final userRepositoryProvider = Provider<UserRepository>((ref) => FirestoreUserRepository(ref.watch(firestoreProvider)));
final contentRepositoryProvider = Provider<ContentRepository>((ref) => FirestoreContentRepository(ref.watch(firestoreProvider)));
final jobsRepositoryProvider = Provider<JobsRepository>((ref) => JobsRepository(ref.watch(firestoreProvider)));

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

/// Max goals per user (prototype: "Up to 5 goals").
const maxGoals = 5;
