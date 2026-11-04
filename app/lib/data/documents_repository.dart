// users/{uid}/documents + Storage upload (storage.rules: owner only).
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../core/models/models.dart';
import 'firestore_codec.dart';

abstract class DocumentsRepository {
  Stream<List<UserDocument>> documents(String uid);

  /// Uploads the bytes and creates the Firestore doc; returns its id.
  Future<String> upload(String uid, {required String type, required UserDocumentCategory category, required String fileName, required Uint8List bytes, String? expiresAt});
  Future<void> update(String uid, String docId, Map<String, Object?> patch);
  Future<void> delete(String uid, String docId);
}

class FirebaseDocumentsRepository implements DocumentsRepository {
  FirebaseDocumentsRepository(this._db, this._storage);
  final FirebaseFirestore _db;
  final FirebaseStorage _storage;

  CollectionReference<Map<String, dynamic>> _col(String uid) => _db.collection('users').doc(uid).collection('documents');

  @override
  Stream<List<UserDocument>> documents(String uid) => _col(uid).orderBy('uploadedAt', descending: true).snapshots().map((q) => q.parse(UserDocument.fromJson));

  @override
  Future<String> upload(String uid, {required String type, required UserDocumentCategory category, required String fileName, required Uint8List bytes, String? expiresAt}) async {
    final ref = _col(uid).doc();
    final path = 'users/$uid/documents/${ref.id}/$fileName';
    await _storage.ref(path).putData(bytes);
    await ref.set({
      'type': type,
      'name': fileName,
      'fileName': fileName,
      'category': category.value,
      'storagePath': path,
      'sizeBytes': bytes.length,
      'status': 'uploaded',
      'expiresAt': ?expiresAt,
      'uploadedAt': FieldValue.serverTimestamp(),
    });
    return ref.id;
  }

  @override
  Future<void> update(String uid, String docId, Map<String, Object?> patch) =>
      _col(uid).doc(docId).set({for (final e in patch.entries) e.key: e.value ?? FieldValue.delete()}, SetOptions(merge: true));

  @override
  Future<void> delete(String uid, String docId) async {
    final snap = await _col(uid).doc(docId).get();
    final path = snap.data()?['storagePath'] as String?;
    if (path != null) {
      try {
        await _storage.ref(path).delete();
      } catch (_) {}
    }
    await _col(uid).doc(docId).delete();
  }
}
