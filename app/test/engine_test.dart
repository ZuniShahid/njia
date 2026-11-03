// Port of functions/test/engine.test.mjs – the same 4 cases against the same seed data.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/core/engine/engine.dart';
import 'package:njia_careers/core/models/models.dart';

/// Repo root = first ancestor of the working directory that contains `seed/`.
Directory repoRoot() {
  var dir = Directory.current;
  while (!Directory('${dir.path}/seed').existsSync()) {
    final parent = dir.parent;
    if (parent.path == dir.path) throw StateError('seed/ not found above ${Directory.current.path}');
    dir = parent;
  }
  return dir;
}

List<dynamic> loadSeed(String collection) =>
    jsonDecode(File('${repoRoot().path}/seed/$collection.json').readAsStringSync()) as List<dynamic>;

final content = ContentBundle.fromJsonLists({
  for (final c in ['countries', 'corridors', 'pathways', 'requirements', 'residencePermits', 'funding', 'occupations'])
    c: loadSeed(c),
});

const _editorial = Provenance(sourceId: 'test', trust: ProvenanceTrust.editorial, fetchedAt: '2026-11-02T00:00:00Z');

void main() {
  test('CEFR comparison works for >=', () {
    const req = Requirement(
      id: 'german-b1',
      type: RequirementType.languageTest,
      label: Localized(en: 'German B1'),
      key: 'language.de.cefr',
      operator: RequirementOperator.gte,
      value: 'B1',
      provenance: _editorial,
    );
    expect(evaluateRequirement(req, {'language.de.cefr': 'B2'}).status, RequirementStatus.met);
    expect(evaluateRequirement(req, {'language.de.cefr': 'A2'}).status, RequirementStatus.gap);
    expect(evaluateRequirement(req, {}).status, RequirementStatus.unknown);
  });

  test('profile flattening', () {
    final f = factsFromProfile(const UserProfile(
      languages: [UserLanguage(lang: 'en', test: 'IELTS', score: '6.5')],
      education: [UserEducation(isced: Isced.level6, status: UserEducationStatus.completed, grade: 'second_upper')],
      experienceMonths: 3,
      savings: Money(amount: 2000, currency: 'EUR'),
    ));
    expect(f['language.en.ielts'], 6.5);
    expect(f['education.maxIsced'], 6);
    expect(f['education.bachelor.classification'], 'second_upper');
    expect(f['funds.eur'], 2000);
  });

  test('plan Sierra Leone -> Deutsche Bank via Frankfurt School', () {
    const profile = UserProfile(
      nationality: 'SL',
      facts: {'language.en.ielts': 6.5, 'education.maxIsced': 6, 'experienceMonths': 3, 'documents.passport.valid': true},
      savings: Money(amount: 3000, currency: 'EUR'),
    );
    const goal = Goal(
      id: 'g1',
      occupationId: 'isco-2413',
      countryId: 'DE',
      targetYear: 2032,
      pathwayIds: ['fs-master-of-finance', 'db-graduate-programme'],
    );
    final plan = buildPlan(goal: goal, profile: profile, content: content, now: DateTime.utc(2026, 11, 2));
    expect(plan.corridorId, 'SL-DE');
    expect(plan.pathwayIds, ['fs-master-of-finance', 'db-graduate-programme']);
    expect(plan.gaps.any((g) => g.requirementId == 'de-blocked-account'), isTrue, reason: 'blocked account is a gap');
    final visaStep = plan.steps.where((s) => s.kind == PlanStepKind.visa && s.permitId == 'DE-student').firstOrNull;
    expect(visaStep, isNotNull, reason: 'student visa step present');
    expect(visaStep!.applyAt?.city, 'Accra');
    expect(plan.costs.any((c) => c.kind == PlanCostKind.tuition && c.min == 42000), isTrue);
    expect(plan.scores.readiness, allOf(greaterThan(0), lessThan(100)));
    expect(plan.scores.difficulty, allOf(greaterThanOrEqualTo(1), lessThanOrEqualTo(5)));
    expect(plan.totalMonths, greaterThan(24));
    expect(plan.watch.any((w) => w.kind == 'visa'), isTrue);
  });

  test('inferred pathways when goal has none', () {
    const goal = Goal(occupationId: 'isco-2413', countryId: 'HU');
    final plan = buildPlan(goal: goal, profile: const UserProfile(nationality: 'SL', facts: {}), content: content);
    expect(plan.pathwayIds, contains('hu-ba-business-corvinus'));
    expect(plan.corridorId, 'SL-HU');
  });
}
