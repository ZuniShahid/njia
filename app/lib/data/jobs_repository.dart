// jobs collection: imported from APIs/partner feeds (Adzuna, Bundesagentur), TTL on expireAt.
// Rule 3/4 in CLAUDE.md: never from scraping, fit ranking is never for sale.
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/models.dart';
import 'firestore_codec.dart';

class JobsRepository {
  JobsRepository(this._db);

  final FirebaseFirestore _db;

  /// Filters as in the prototype jobs view: country, level, min salary (client-side), remote (later).
  /// Needs the composite indexes in firestore.indexes.json.
  Future<List<Job>> search({
    String? countryId,
    String? occupationId,
    JobLevel? level,
    double? minSalary,
    int limit = 50,
  }) async {
    Query<Map<String, dynamic>> q = _db.collection('jobs');
    if (countryId != null) q = q.where('countryId', isEqualTo: countryId);
    if (occupationId != null) q = q.where('occupationId', isEqualTo: occupationId);
    if (level != null) q = q.where('level', isEqualTo: level.value);
    q = q.orderBy('postedAt', descending: true).limit(limit);
    final jobs = (await q.get()).parse(Job.fromJson);
    if (minSalary == null) return jobs;
    return jobs.where((j) => (j.salary?.max ?? 0) >= minSalary).toList();
  }
}
