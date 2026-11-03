// users/{uid} and its subcollections (owner-only, see firestore.rules).
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/models.dart';
import 'firestore_codec.dart';

class UserRepository {
  UserRepository(this._db);

  final FirebaseFirestore _db;

  DocumentReference<Map<String, dynamic>> _user(String uid) => _db.collection('users').doc(uid);

  Stream<UserProfile?> profile(String uid) =>
      _user(uid).snapshots().map((d) => d.exists ? UserProfile.fromJson(docToJson(d)) : null);

  Future<void> saveProfile(UserProfile profile) {
    final uid = profile.id;
    if (uid == null) throw ArgumentError('profile.id (uid) is required');
    return _user(uid).set(jsonToDoc(profile.toJson()), SetOptions(merge: true));
  }

  Stream<List<Goal>> goals(String uid) =>
      _user(uid).collection('goals').orderBy('priority').snapshots().map((q) => q.parse(Goal.fromJson));

  /// Creates or updates a goal. Writing a goal triggers `onGoalWritten` → `computePlan` on the server.
  Future<String> saveGoal(String uid, Goal goal) async {
    final col = _user(uid).collection('goals');
    final ref = goal.id == null ? col.doc() : col.doc(goal.id);
    await ref.set(jsonToDoc(goal.toJson()), SetOptions(merge: true));
    return ref.id;
  }

  Future<void> deleteGoal(String uid, String goalId) => _user(uid).collection('goals').doc(goalId).delete();

  /// The canonical server plan for a goal (null until computePlan has run).
  Stream<Plan?> plan(String uid, String goalId) =>
      _user(uid).collection('plans').doc(goalId).snapshots().map((d) => d.exists ? Plan.fromJson(docToJson(d)) : null);

  Stream<List<UserDocument>> documents(String uid) =>
      _user(uid).collection('documents').snapshots().map((q) => q.parse(UserDocument.fromJson));

  Future<void> saveOutcome(String uid, Outcome outcome) =>
      _user(uid).collection('outcomes').add(jsonToDoc(outcome.toJson()));
}
