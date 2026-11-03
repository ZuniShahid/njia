// Every seed document parses with its generated model and survives a toJson/fromJson round trip.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/core/models/models.dart';

Directory repoRoot() {
  var dir = Directory.current;
  while (!Directory('${dir.path}/seed').existsSync()) {
    dir = dir.parent;
  }
  return dir;
}

void main() {
  final parsers = <String, Object Function(Map<String, dynamic>)>{
    'countries': Country.fromJson,
    'corridors': Corridor.fromJson,
    'pathways': Pathway.fromJson,
    'requirements': Requirement.fromJson,
    'residencePermits': ResidencePermit.fromJson,
    'funding': Funding.fromJson,
    'occupations': Occupation.fromJson,
    'providers': ServiceProvider.fromJson,
    'sources': ContentSource.fromJson,
    'trustAlerts': TrustAlert.fromJson,
  };

  for (final entry in parsers.entries) {
    test('seed/${entry.key}.json round-trips', () {
      final docs = jsonDecode(File('${repoRoot().path}/seed/${entry.key}.json').readAsStringSync()) as List<dynamic>;
      expect(docs, isNotEmpty);
      for (final raw in docs) {
        final json = Map<String, dynamic>.from(raw as Map);
        final model = entry.value(json);
        final again = entry.value(jsonDecode(jsonEncode((model as dynamic).toJson())) as Map<String, dynamic>);
        expect(again, model, reason: '${entry.key}/${json['id']}');
      }
    });
  }

  test('provenance trust and enums keep their wire values', () {
    expect(ProvenanceTrust.estimate.value, 'estimate');
    expect(RequirementOperator.gte.value, '>=');
    expect(Isced.level6.value, '6');
    expect(Cefr.b2.value, 'B2');
  });
}
