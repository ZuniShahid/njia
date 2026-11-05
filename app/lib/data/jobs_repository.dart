// jobs collection: imported from APIs/partner feeds (Adzuna, Bundesagentur), TTL on expireAt.
// Rule 3/4 in CLAUDE.md: never from scraping, fit ranking is never for sale.
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/models.dart';
import 'firestore_codec.dart';

abstract class JobsRepository {
  /// Newest postings, optionally limited to one country; filtering by level/salary/text is done client-side
  /// because the collection is small per country (daily Adzuna import, 30-day TTL).
  Future<List<Job>> recent({String? countryId, int limit = 200});
}

class FirestoreJobsRepository implements JobsRepository {
  FirestoreJobsRepository(this._db);
  final FirebaseFirestore _db;

  @override
  Future<List<Job>> recent({String? countryId, int limit = 200}) async {
    Query<Map<String, dynamic>> q = _db.collection('jobs');
    if (countryId != null) q = q.where('countryId', isEqualTo: countryId);
    q = q.orderBy('postedAt', descending: true).limit(limit);
    return (await q.get()).parse(Job.fromJson);
  }
}
