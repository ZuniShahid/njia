// users/{uid} and its subcollections (owner-only, see firestore.rules). Interface + Firestore
// implementation; lib/preview/fakes.dart has an in-memory version for tests and previews.
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/models.dart';
import 'firestore_codec.dart';

abstract class UserRepository {
  Stream<UserProfile?> profile(String uid);

  /// Creates users/{uid} if it does not exist yet (first sign-in).
  Future<void> ensureProfile(AuthLike user);

  /// Partial update. A null value deletes the field.
  Future<void> updateProfile(String uid, Map<String, Object?> patch);

  Stream<List<Goal>> goals(String uid);

  /// Creates or updates a goal and returns its id. Writing a goal triggers `onGoalWritten` → `computePlan`.
  Future<String> saveGoal(String uid, Goal goal);
  Future<void> deleteGoal(String uid, String goalId);

  /// The canonical server plan (null until computePlan has run).
  Stream<Plan?> plan(String uid, String goalId);
  Stream<List<UserDocument>> documents(String uid);
  Future<void> saveOutcome(String uid, Outcome outcome);

  /// Deletes the profile and all subcollections (account deletion).
  Future<void> deleteAllUserData(String uid);
}

/// The few auth fields the repository needs to create a profile (avoids a firebase_auth import here).
class AuthLike {
  const AuthLike({required this.uid, this.email, this.displayName});
  final String uid;
  final String? email;
  final String? displayName;
}

class FirestoreUserRepository implements UserRepository {
  FirestoreUserRepository(this._db);

  final FirebaseFirestore _db;

  DocumentReference<Map<String, dynamic>> _user(String uid) => _db.collection('users').doc(uid);

  @override
  Stream<UserProfile?> profile(String uid) =>
      _user(uid).snapshots().map((d) => d.exists ? UserProfile.fromJson(docToJson(d)) : null);

  @override
  Future<void> ensureProfile(AuthLike user) async {
    final ref = _user(user.uid);
    final snap = await ref.get();
    if (snap.exists) return;
    await ref.set({
      'displayName': user.displayName ?? '',
      'email': user.email ?? '',
      'nationality': 'SL',
      'residenceCountry': 'SL',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updateProfile(String uid, Map<String, Object?> patch) {
    final data = {for (final e in patch.entries) e.key: e.value ?? FieldValue.delete()};
    return _user(uid).set(data, SetOptions(merge: true));
  }

  @override
  Stream<List<Goal>> goals(String uid) =>
      _user(uid).collection('goals').orderBy('createdAt').snapshots().map((q) => q.parse(Goal.fromJson));

  @override
  Future<String> saveGoal(String uid, Goal goal) async {
    final col = _user(uid).collection('goals');
    final isNew = goal.id == null;
    final ref = isNew ? col.doc() : col.doc(goal.id);
    final data = jsonToDoc(goal.toJson());
    if (isNew) data['createdAt'] = FieldValue.serverTimestamp();
    data['updatedAt'] = FieldValue.serverTimestamp();
    await ref.set(data, SetOptions(merge: true));
    return ref.id;
  }

  @override
  Future<void> deleteGoal(String uid, String goalId) => _user(uid).collection('goals').doc(goalId).delete();

  @override
  Stream<Plan?> plan(String uid, String goalId) =>
      _user(uid).collection('plans').doc(goalId).snapshots().map((d) => d.exists ? Plan.fromJson(docToJson(d)) : null);

  @override
  Stream<List<UserDocument>> documents(String uid) =>
      _user(uid).collection('documents').snapshots().map((q) => q.parse(UserDocument.fromJson));

  @override
  Future<void> saveOutcome(String uid, Outcome outcome) =>
      _user(uid).collection('outcomes').add(jsonToDoc(outcome.toJson()));

  @override
  Future<void> deleteAllUserData(String uid) async {
    for (final sub in ['goals', 'documents', 'outcomes']) {
      final q = await _user(uid).collection(sub).get();
      for (final d in q.docs) {
        await d.reference.delete();
      }
    }
    await _user(uid).delete();
  }
}
