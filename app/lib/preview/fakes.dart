// In-memory implementations of the services for previews (main_preview.dart) and widget tests.
import 'dart:async';

import 'package:riverpod/misc.dart' show Override;

import '../app/providers.dart';
import '../core/engine/content_bundle.dart';
import '../core/models/models.dart';
import '../data/auth_service.dart';
import '../data/content_repository.dart';
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
  Future<void> deleteAllUserData(String uid) async {
    _profiles.remove(uid);
    _goals.remove(uid);
    _profileCtrl.add(null);
    _goalsCtrl.add(null);
  }
}

class FakeContentRepository implements ContentRepository {
  const FakeContentRepository();

  @override
  Future<String?> contentVersion() async => 'preview';
  @override
  Future<List<Country>> countries() async => sampleCountries.where((c) => c.active == true).toList();
  @override
  Future<Country?> country(String id) async => sampleCountries.where((c) => c.id == id).firstOrNull;
  @override
  Future<List<Occupation>> occupations() async => sampleOccupations;
  @override
  Future<List<TrustAlert>> trustAlerts(String countryId) async => const [];
  @override
  Future<List<ContentSource>> sources() async => const [];
  @override
  Future<ContentBundle> corridorBundle({String origin = 'SL', required String destination}) async =>
      ContentBundle(countries: sampleCountries, occupations: sampleOccupations);
}

/// Provider overrides for a signed-in (or signed-out) preview with sample data.
List<Override> previewOverrides({bool signedIn = true}) {
  final auth = FakeAuthService(
    user: signedIn ? const AuthUser(uid: sampleUid, email: 'aminata.kamara@example.com', displayName: 'Aminata Kamara') : null,
  );
  final users = FakeUserRepository(profile: sampleProfile, goals: sampleGoals);
  return [
    firebaseReadyProvider.overrideWithValue(true),
    authServiceProvider.overrideWithValue(auth),
    userRepositoryProvider.overrideWithValue(users),
    contentRepositoryProvider.overrideWithValue(const FakeContentRepository()),
  ];
}
