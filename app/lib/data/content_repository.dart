// Reads approved content (public read, see firestore.rules). Firestore persistence makes every
// read work offline after the first load; bundle caching by meta/content.version is still to do.
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/engine/content_bundle.dart';
import '../core/models/models.dart';
import 'firestore_codec.dart';

abstract class ContentRepository {
  Future<String?> contentVersion();
  Future<List<Country>> countries();
  Future<Country?> country(String id);
  Future<List<Occupation>> occupations();
  Future<List<TrustAlert>> trustAlerts(String countryId);
  Future<List<ContentSource>> sources();

  /// Tutors, language schools, test centres… (`services` = requirement ids they help with).
  Future<List<ServiceProvider>> providers();

  /// Everything the engine needs for one corridor (origin → destination), ≈ < 200 KB.
  Future<ContentBundle> corridorBundle({String origin = 'SL', required String destination});
}

class FirestoreContentRepository implements ContentRepository {
  FirestoreContentRepository(this._db);

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> _c(String name) => _db.collection(name);

  @override
  Future<String?> contentVersion() async {
    final doc = await _db.doc('meta/content').get();
    return doc.data()?['version'] as String?;
  }

  @override
  Future<List<Country>> countries() async => (await _c('countries').where('active', isEqualTo: true).get()).parse(Country.fromJson);

  @override
  Future<Country?> country(String id) async {
    final doc = await _c('countries').doc(id).get();
    return doc.exists ? Country.fromJson(docToJson(doc)) : null;
  }

  @override
  Future<List<Occupation>> occupations() async => (await _c('occupations').get()).parse(Occupation.fromJson);

  @override
  Future<List<TrustAlert>> trustAlerts(String countryId) async =>
      (await _c('trustAlerts').where('countryIds', arrayContains: countryId).get()).parse(TrustAlert.fromJson);

  @override
  Future<List<ContentSource>> sources() async => (await _c('sources').get()).parse(ContentSource.fromJson);

  @override
  Future<List<ServiceProvider>> providers() async => (await _c('providers').get()).parse(ServiceProvider.fromJson);

  @override
  Future<ContentBundle> corridorBundle({String origin = 'SL', required String destination}) async {
    final results = await Future.wait([
      _c('countries').where(FieldPath.documentId, whereIn: [origin, destination]).get(),
      _c('corridors').doc('$origin-$destination').get(),
      _c('pathways').where('countryId', isEqualTo: destination).where('status', isEqualTo: 'published').get(),
      _c('residencePermits').where('countryId', isEqualTo: destination).get(),
      _c('funding').where('countryIds', arrayContains: destination).get(),
      _c('occupations').get(),
    ]);
    final countries = (results[0] as QuerySnapshot<Map<String, dynamic>>).parse(Country.fromJson);
    final corridorDoc = results[1] as DocumentSnapshot<Map<String, dynamic>>;
    final pathways = (results[2] as QuerySnapshot<Map<String, dynamic>>).parse(Pathway.fromJson);
    final permits = (results[3] as QuerySnapshot<Map<String, dynamic>>).parse(ResidencePermit.fromJson);
    final funding = (results[4] as QuerySnapshot<Map<String, dynamic>>).parse(Funding.fromJson);
    final occupations = (results[5] as QuerySnapshot<Map<String, dynamic>>).parse(Occupation.fromJson);

    // requirements are referenced by id from pathways, permits and funding
    final reqIds = <String>{
      for (final p in pathways) ...p.requirementIds,
      for (final p in permits) ...p.requirementIds,
      for (final f in funding) ...f.requirementIds,
    }.toList();
    final requirements = <Requirement>[];
    for (var i = 0; i < reqIds.length; i += 30) {
      final chunk = reqIds.sublist(i, i + 30 > reqIds.length ? reqIds.length : i + 30);
      requirements.addAll((await _c('requirements').where(FieldPath.documentId, whereIn: chunk).get()).parse(Requirement.fromJson));
    }

    return ContentBundle(
      countries: countries,
      corridors: corridorDoc.exists ? [Corridor.fromJson(docToJson(corridorDoc))] : const [],
      pathways: pathways,
      requirements: requirements,
      residencePermits: permits,
      funding: funding,
      occupations: occupations,
    );
  }
}
