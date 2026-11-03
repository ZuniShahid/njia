// The Dart engine must produce exactly what functions/src/engine.mjs produces (the server plan is
// canonical). Fixture: app/test/fixtures/engine_plans.json, regenerated with `node scripts/engine-fixture.mjs`.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/core/engine/engine.dart';
import 'package:njia_careers/core/models/models.dart';

Directory repoRoot() {
  var dir = Directory.current;
  while (!Directory('${dir.path}/seed').existsSync()) {
    dir = dir.parent;
  }
  return dir;
}

/// JSON as JS would see it: no null/undefined keys, no empty arrays the JS side never writes,
/// integral doubles as ints.
Object? normalize(Object? v) {
  if (v is Map) {
    return {
      for (final e in v.entries)
        if (e.value != null && !(e.value is List && (e.value as List).isEmpty)) e.key.toString(): normalize(e.value),
    };
  }
  if (v is List) return v.map(normalize).toList();
  if (v is double && v == v.truncateToDouble() && v.isFinite) return v.toInt();
  return v;
}

void main() {
  final root = repoRoot().path;
  List<dynamic> load(String c) => jsonDecode(File('$root/seed/$c.json').readAsStringSync()) as List<dynamic>;
  final content = ContentBundle.fromJsonLists({
    for (final c in ['countries', 'corridors', 'pathways', 'requirements', 'residencePermits', 'funding', 'occupations']) c: load(c),
  });
  final cases = jsonDecode(File('$root/app/test/fixtures/engine_plans.json').readAsStringSync()) as List<dynamic>;

  for (final raw in cases) {
    final c = raw as Map<String, dynamic>;
    test('parity with engine.mjs: ${c['name']}', () {
      final plan = buildPlan(
        goal: Goal.fromJson(c['goal'] as Map<String, dynamic>),
        profile: UserProfile.fromJson(c['profile'] as Map<String, dynamic>),
        content: content,
        now: DateTime.parse(c['now'] as String),
      );
      final actual = normalize(jsonDecode(jsonEncode(plan.toJson()))) as Map;
      actual.remove('id'); // Dart-only: Firestore doc id mirror of goalId
      expect(actual, equals(normalize(c['plan'])));
    });
  }
}
