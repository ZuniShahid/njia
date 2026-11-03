// Firestore <-> model JSON. Timestamps become ISO strings (docs/data-model.md: readers must accept
// both Timestamps from the seed script/functions and ISO strings from n8n); the doc id is injected
// as `id` and stripped again on write.
import 'package:cloud_firestore/cloud_firestore.dart';

/// Snapshot data as plain JSON with `id` set, Timestamps converted to ISO-8601 UTC strings.
Map<String, dynamic> docToJson(DocumentSnapshot<Map<String, dynamic>> doc) {
  final data = normalizeFirestoreValue(doc.data() ?? const <String, dynamic>{}) as Map<String, dynamic>;
  return {...data, 'id': doc.id};
}

/// Model JSON ready to write: no `id` field (the doc id is the path), no nulls at the top level.
Map<String, dynamic> jsonToDoc(Map<String, dynamic> json) {
  final out = Map<String, dynamic>.from(json)..remove('id');
  out.removeWhere((_, v) => v == null);
  return out;
}

Object? normalizeFirestoreValue(Object? v) {
  if (v is Timestamp) return v.toDate().toUtc().toIso8601String();
  if (v is Map) return {for (final e in v.entries) e.key.toString(): normalizeFirestoreValue(e.value)};
  if (v is List) return v.map(normalizeFirestoreValue).toList();
  return v;
}

extension QueryJson on QuerySnapshot<Map<String, dynamic>> {
  List<T> parse<T>(T Function(Map<String, dynamic>) fromJson) => docs.map((d) => fromJson(docToJson(d))).toList();
}
