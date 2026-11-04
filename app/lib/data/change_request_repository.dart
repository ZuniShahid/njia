// changeRequests: the approval queue (editors/admins only, see firestore.rules).
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/models.dart';
import 'firestore_codec.dart';

abstract class ChangeRequestRepository {
  Stream<List<ChangeRequest>> pending();

  /// Moves a pending request to approved/rejected; the rules only allow `status` + `reviewer`.
  Future<void> decide(String id, {required bool approve, required String reviewerUid, String? note});
}

class FirestoreChangeRequestRepository implements ChangeRequestRepository {
  FirestoreChangeRequestRepository(this._db);
  final FirebaseFirestore _db;

  @override
  Stream<List<ChangeRequest>> pending() => _db
      .collection('changeRequests')
      .where('status', isEqualTo: 'pending')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((q) => q.parse(ChangeRequest.fromJson));

  @override
  Future<void> decide(String id, {required bool approve, required String reviewerUid, String? note}) =>
      _db.collection('changeRequests').doc(id).update({
        'status': approve ? 'approved' : 'rejected',
        'reviewer': {'uid': reviewerUid, 'channel': 'admin_ui', 'note': note ?? '', 'decidedAt': FieldValue.serverTimestamp()},
      });
}
