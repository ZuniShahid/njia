// In-memory implementations of the services for previews (main_preview.dart) and widget tests.
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;

import 'package:riverpod/misc.dart' show Override;

import '../app/providers.dart';
import '../core/engine/content_bundle.dart';
import '../core/models/models.dart';
import '../data/auth_service.dart';
import '../data/change_request_repository.dart';
import '../data/coach_service.dart';
import '../data/content_repository.dart';
import '../data/documents_repository.dart';
import '../data/jobs_repository.dart';
import '../data/plan_service.dart';
import '../data/user_repository.dart';
import 'sample_data.dart';

class FakeAuthService implements AuthService {
  FakeAuthService({AuthUser? user}) {
    _user = user;
  }

  AuthUser? _user;
  final _ctrl = StreamController<AuthUser?>.broadcast();

  /// Emails that "exist" – sign-in with any other email fails like Firebase would.
  final Map<String, String> passwords = {'aminata.kamara@example.com': 'prototype'};

  void _emit() => _ctrl.add(_user);

  @override
  Stream<AuthUser?> authStateChanges() async* {
    yield _user;
    yield* _ctrl.stream;
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<AuthUser> signInWithEmail(String email, String password) async {
    if (passwords[email.trim()] != password) throw const AuthFailure('Email or password is wrong.', code: 'invalid-credential');
    _user = AuthUser(uid: sampleUid, email: email.trim(), displayName: sampleProfile.displayName);
    _emit();
    return _user!;
  }

  @override
  Future<AuthUser> createAccount({required String name, required String email, required String password}) async {
    if (passwords.containsKey(email.trim())) throw const AuthFailure('There is already an account with this email. Sign in instead.', code: 'email-already-in-use');
    passwords[email.trim()] = password;
    _user = AuthUser(uid: 'new-${email.hashCode}', email: email.trim(), displayName: name.trim());
    _emit();
    return _user!;
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    _user = const AuthUser(uid: sampleUid, email: 'aminata.kamara@example.com', displayName: 'Aminata Kamara');
    _emit();
    return _user!;
  }

  @override
  Future<void> sendPasswordReset(String email) async {}

  @override
  Future<void> changePassword(String newPassword) async {
    if (_user?.email != null) passwords[_user!.email!] = newPassword;
  }

  @override
  Future<void> deleteAccount() async {
    _user = null;
    _emit();
  }

  @override
  Future<void> signOut() async {
    _user = null;
    _emit();
  }
}

class FakeUserRepository implements UserRepository {
  FakeUserRepository({UserProfile? profile, List<Goal> goals = const []})
      : _profiles = {if (profile?.id != null) profile!.id!: profile},
        _goals = {if (profile?.id != null) profile!.id!: [...goals]};

  final Map<String, UserProfile> _profiles;
  final Map<String, List<Goal>> _goals;
  final _profileCtrl = StreamController<void>.broadcast();
  final _goalsCtrl = StreamController<void>.broadcast();
  int _seq = 0;

  UserProfile? profileOf(String uid) => _profiles[uid];
  List<Goal> goalsOf(String uid) => List.unmodifiable(_goals[uid] ?? const []);

  @override
  Stream<UserProfile?> profile(String uid) async* {
    yield _profiles[uid];
    yield* _profileCtrl.stream.map((_) => _profiles[uid]);
  }

  @override
  Future<void> ensureProfile(AuthLike user) async {
    _profiles.putIfAbsent(
      user.uid,
      () => UserProfile(id: user.uid, displayName: user.displayName, email: user.email, nationality: 'SL', residenceCountry: 'SL'),
    );
    _profileCtrl.add(null);
  }

  @override
  Future<void> updateProfile(String uid, Map<String, Object?> patch) async {
    final json = Map<String, dynamic>.from((_profiles[uid] ?? UserProfile(id: uid)).toJson());
    for (final e in patch.entries) {
      if (e.value == null) {
        json.remove(e.key);
      } else {
        json[e.key] = e.value;
      }
    }
    json['id'] = uid;
    _profiles[uid] = UserProfile.fromJson(json);
    _profileCtrl.add(null);
  }

  @override
  Future<void> setFact(String uid, String key, Object? value) async {
    final facts = Map<String, dynamic>.from(_profiles[uid]?.facts ?? const {});
    if (value == null) {
      facts.remove(key);
    } else {
      facts[key] = value;
    }
    await updateProfile(uid, {'facts': facts});
  }

  @override
  Stream<List<Goal>> goals(String uid) async* {
    yield goalsOf(uid);
    yield* _goalsCtrl.stream.map((_) => goalsOf(uid));
  }

  @override
  Future<String> saveGoal(String uid, Goal goal) async {
    final list = _goals.putIfAbsent(uid, () => []);
    final id = goal.id ?? 'g${++_seq}-${DateTime.now().millisecondsSinceEpoch}';
    final i = list.indexWhere((g) => g.id == id);
    final saved = goal.copyWith(id: id, createdAt: goal.createdAt ?? DateTime.now().toUtc().toIso8601String());
    if (i < 0) {
      list.add(saved);
    } else {
      list[i] = saved;
    }
    _goalsCtrl.add(null);
    return id;
  }

  @override
  Future<void> deleteGoal(String uid, String goalId) async {
    _goals[uid]?.removeWhere((g) => g.id == goalId);
    _goalsCtrl.add(null);
  }

  @override
  Stream<Plan?> plan(String uid, String goalId) => Stream.value(null);

  @override
  Stream<List<UserDocument>> documents(String uid) => Stream.value(const []);

  @override
  Future<void> saveOutcome(String uid, Outcome outcome) async {}

  @override
  Future<bool> deleteAllUserData(String uid) async {
    _profiles.remove(uid);
    _goals.remove(uid);
    _profileCtrl.add(null);
    _goalsCtrl.add(null);
    return false;
  }
}

/// Content from the seed files (app/assets/seed, copied by `npm run gen:models`).
class FakeContentRepository implements ContentRepository {
  const FakeContentRepository();

  // Cache the decoded data, never the Future: widget tests each run in their own FakeAsync zone and
  // a Future created in one test would never complete in the next.
  static Map<String, List<dynamic>>? _seed;

  static Future<Map<String, List<dynamic>>> seed() async {
    if (_seed != null) return _seed!;
    final out = <String, List<dynamic>>{};
    for (final c in ['countries', 'corridors', 'pathways', 'requirements', 'residencePermits', 'funding', 'occupations', 'trustAlerts', 'sources', 'providers']) {
      out[c] = jsonDecode(await rootBundle.loadString('assets/seed/$c.json')) as List<dynamic>;
    }
    return _seed = out;
  }

  @override
  Future<String?> contentVersion() async => 'preview';
  @override
  Future<List<Country>> countries() async => sampleCountries.where((c) => c.active == true).toList();
  @override
  Future<Country?> country(String id) async => sampleCountries.where((c) => c.id == id).firstOrNull;
  @override
  Future<List<Occupation>> occupations() async => sampleOccupations;
  @override
  Future<List<TrustAlert>> trustAlerts(String countryId) async => (await seed())['trustAlerts']!
      .map((e) => TrustAlert.fromJson(Map<String, dynamic>.from(e as Map)))
      .where((a) => a.countryIds.contains(countryId))
      .toList();
  @override
  Future<List<ServiceProvider>> providers() async =>
      (await seed())['providers']!.map((e) => ServiceProvider.fromJson(Map<String, dynamic>.from(e as Map))).toList();

  @override
  Future<List<ContentSource>> sources() async =>
      (await seed())['sources']!.map((e) => ContentSource.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  @override
  Future<ContentBundle> corridorBundle({String origin = 'SL', required String destination}) async {
    final all = ContentBundle.fromJsonLists(await seed());
    return ContentBundle(
      countries: all.countries,
      corridors: all.corridors.where((c) => c.origin == origin && c.destination == destination).toList(),
      pathways: all.pathways.where((p) => p.countryId == destination).toList(),
      requirements: all.requirements,
      residencePermits: all.residencePermits.where((p) => p.countryId == destination).toList(),
      funding: all.funding.where((f) => f.countryIds.contains(destination)).toList(),
      occupations: all.occupations,
    );
  }
}

/// Clearly marked sample postings (source "preview-sample") so the jobs screen has something to show.
class FakeJobsRepository implements JobsRepository {
  const FakeJobsRepository();
  @override
  Future<List<Job>> recent({String? countryId, int limit = 200}) async =>
      sampleJobs.where((j) => countryId == null || j.countryId == countryId).take(limit).toList();
}

class FakeDocumentsRepository implements DocumentsRepository {
  FakeDocumentsRepository({List<UserDocument> docs = const []}) : _docs = [...docs];
  final List<UserDocument> _docs;
  final _ctrl = StreamController<void>.broadcast();
  int _seq = 0;
  List<UserDocument> get docs => List.unmodifiable(_docs);

  @override
  Stream<List<UserDocument>> documents(String uid) async* {
    yield docs;
    yield* _ctrl.stream.map((_) => docs);
  }

  @override
  Future<String> upload(String uid, {required String type, required UserDocumentCategory category, required String fileName, required Uint8List bytes, String? expiresAt}) async {
    final id = 'doc${++_seq}';
    _docs.insert(0, UserDocument(id: id, type: type, name: fileName, fileName: fileName, category: category, storagePath: 'preview/$fileName', sizeBytes: bytes.length, status: UserDocumentStatus.uploaded, expiresAt: expiresAt, uploadedAt: DateTime.now().toUtc().toIso8601String()));
    _ctrl.add(null);
    return id;
  }

  @override
  Future<void> update(String uid, String docId, Map<String, Object?> patch) async {
    final i = _docs.indexWhere((d) => d.id == docId);
    if (i < 0) return;
    final json = Map<String, dynamic>.from(_docs[i].toJson());
    for (final e in patch.entries) {
      if (e.value == null) {
        json.remove(e.key);
      } else {
        json[e.key] = e.value;
      }
    }
    _docs[i] = UserDocument.fromJson(json);
    _ctrl.add(null);
  }

  @override
  Future<void> delete(String uid, String docId) async {
    _docs.removeWhere((d) => d.id == docId);
    _ctrl.add(null);
  }
}

class FakeChangeRequestRepository implements ChangeRequestRepository {
  FakeChangeRequestRepository({List<ChangeRequest> pending = const []}) : _items = [...pending];
  final List<ChangeRequest> _items;
  final _ctrl = StreamController<void>.broadcast();
  final decisions = <String, (bool, String?)>{};

  @override
  Stream<List<ChangeRequest>> pending() async* {
    yield List.unmodifiable(_items);
    yield* _ctrl.stream.map((_) => List.unmodifiable(_items));
  }

  @override
  Future<void> decide(String id, {required bool approve, required String reviewerUid, String? note}) async {
    decisions[id] = (approve, note);
    _items.removeWhere((c) => c.id == id);
    _ctrl.add(null);
  }
}

/// No model behind it: answers only from the plan data handed over in [context], clearly labelled.
class FakeCoachService implements CoachService {
  const FakeCoachService();
  @override
  Future<String> ask({required String goalId, required Map<String, Object?> context, required List<CoachMessage> history, required String question}) async {
    final about = context['about'] ?? 'your plan';
    return 'Preview answer (no AI behind it yet): I can see you are asking about $about. Once the coach function is deployed, answers will cite the source of every number. Until then, open the step on the roadmap for what it needs.';
  }
}

class FakePlanService implements PlanService {
  int calls = 0;
  @override
  Future<void> recompute(String goalId) async => calls++;
}

/// Provider overrides for a signed-in (or signed-out) preview with sample data.
List<Override> previewOverrides({bool signedIn = true, UserProfile? profile, List<Goal>? goals, CoachService? coach}) {
  final auth = FakeAuthService(
    user: signedIn ? const AuthUser(uid: sampleUid, email: 'aminata.kamara@example.com', displayName: 'Aminata Kamara') : null,
  );
  final users = FakeUserRepository(profile: profile ?? sampleProfile, goals: goals ?? sampleGoals);
  return [
    firebaseReadyProvider.overrideWithValue(true),
    authServiceProvider.overrideWithValue(auth),
    userRepositoryProvider.overrideWithValue(users),
    contentRepositoryProvider.overrideWithValue(const FakeContentRepository()),
    planServiceProvider.overrideWithValue(FakePlanService()),
    jobsRepositoryProvider.overrideWithValue(const FakeJobsRepository()),
    documentsRepositoryProvider.overrideWithValue(FakeDocumentsRepository(docs: sampleDocuments)),
    changeRequestRepositoryProvider.overrideWithValue(FakeChangeRequestRepository(pending: sampleChangeRequests)),
    coachServiceProvider.overrideWithValue(coach ?? const FakeCoachService()),
  ];
}
