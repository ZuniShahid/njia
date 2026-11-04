// ReadinessModel and FinanceModel over the seed content with the sample profile (SL → DE).
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/core/engine/engine.dart';
import 'package:njia_careers/core/engine/finance_model.dart';
import 'package:njia_careers/core/engine/readiness_model.dart';
import 'package:njia_careers/core/engine/roadmap_model.dart';
import 'package:njia_careers/core/models/models.dart';
import 'package:njia_careers/preview/sample_data.dart';

Directory repoRoot() {
  var dir = Directory.current;
  while (!Directory('${dir.path}/seed').existsSync()) {
    dir = dir.parent;
  }
  return dir;
}

void main() {
  final root = repoRoot().path;
  List<dynamic> load(String c) => jsonDecode(File('$root/seed/$c.json').readAsStringSync()) as List<dynamic>;
  final all = ContentBundle.fromJsonLists({
    for (final c in ['countries', 'corridors', 'pathways', 'requirements', 'residencePermits', 'funding', 'occupations']) c: load(c),
  });
  final content = ContentBundle(
    countries: all.countries,
    corridors: all.corridors.where((c) => c.destination == 'DE').toList(),
    pathways: all.pathways.where((p) => p.countryId == 'DE').toList(),
    requirements: all.requirements,
    residencePermits: all.residencePermits.where((p) => p.countryId == 'DE').toList(),
    funding: all.funding.where((f) => f.countryIds.contains('DE')).toList(),
    occupations: all.occupations,
  );
  final now = DateTime.utc(2026, 11, 2);
  final goal = sampleGoals.first;
  final profile = sampleProfile;
  final plan = buildPlan(goal: goal, profile: profile.copyWith(facts: factsFromProfile(profile)), content: content, now: now);
  final roadmap = RoadmapModel.build(goal: goal, plan: plan, content: content, now: now);

  group('ReadinessModel', () {
    final m = ReadinessModel.build(goal: goal, profile: profile, content: content);
    test('overall equals the engine readiness and dimensions cover every requirement', () {
      expect(m.overall, plan.scores.readiness);
      expect(m.items.length, neededRequirementIds(selectPathways(goal, content), {for (final p in content.residencePermits) p.id: p}).length);
      expect(m.dimensions.map((d) => d.key), containsAll(['education', 'languages', 'finances', 'visa']));
      expect(m.dimensions.fold<int>(0, (s, d) => s + d.items.length), m.items.length);
      expect(m.levers, isNotEmpty);
      expect(m.levers.length, lessThanOrEqualTo(4));
    });
    test('ticking a requirement raises the score', () {
      final gmat = m.items.firstWhere((i) => i.requirement.id == 'gmat-or-gre').requirement;
      expect(ReadinessModel.satisfyingValue(gmat), true);
      final ticked = ReadinessModel.build(goal: goal, profile: profile.copyWith(facts: {...?profile.facts, gmat.key!: true}), content: content);
      expect(ticked.overall, greaterThan(m.overall));
      expect(ticked.items.firstWhere((i) => i.requirement.id == 'gmat-or-gre').met, isTrue);
    });
    test('ticking IELTS 6.5 makes the stricter IELTS 7.0 (same key) a gap – net score unchanged', () {
      final ielts = m.items.firstWhere((i) => i.requirement.id == 'ielts-6-5').requirement;
      expect(ReadinessModel.satisfyingValue(ielts), 6.5);
      final ticked = ReadinessModel.build(goal: goal, profile: profile.copyWith(facts: {...?profile.facts, ielts.key!: 6.5}), content: content);
      expect(ticked.items.firstWhere((i) => i.requirement.id == 'ielts-6-5').met, isTrue);
      expect(ticked.items.firstWhere((i) => i.requirement.id == 'ielts-7-0').status, RequirementStatus.gap);
      expect(ticked.overall, m.overall);
    });
    test('satisfying values per operator', () {
      const p = Provenance(sourceId: 's', trust: ProvenanceTrust.editorial, fetchedAt: '2026-11-02T00:00:00Z');
      expect(ReadinessModel.satisfyingValue(const Requirement(id: 'a', type: RequirementType.document, label: Localized(en: 'a'), operator: RequirementOperator.exists, provenance: p)), true);
      expect(ReadinessModel.satisfyingValue(const Requirement(id: 'b', type: RequirementType.grade, label: Localized(en: 'b'), operator: RequirementOperator.inList, value: ['first', 'second_upper'], provenance: p)), 'first');
      expect(ReadinessModel.satisfyingValue(const Requirement(id: 'c', type: RequirementType.other, label: Localized(en: 'c'), provenance: p)), isNull);
    });
  });

  group('FinanceModel', () {
    final m = FinanceModel.build(roadmap: roadmap, profile: profile);
    test('costs come from the plan with provenance, funds from the profile', () {
      expect(m.costs, isNotEmpty);
      expect(m.costs.every((c) => c.provenance != null), isTrue, reason: 'every cost line points at a content doc');
      expect(m.totalCost, closeTo(plan.costs.where((c) => c.currency == 'EUR').fold<double>(0, (s, c) => s + (c.min ?? c.amount ?? 0)), 1));
      expect(m.sources.map((s) => s.source), containsAll([FundSource.savings, FundSource.family]));
      expect(m.sources.firstWhere((s) => s.source == FundSource.savings).total, 2600);
      expect(m.gap, greaterThan(0));
      expect(m.coverage, inInclusiveRange(0, 100));
      expect(m.perYear.first.year, 2026);
      expect(m.perYear.last.cumulative, closeTo(m.totalFunds - m.totalCost, 1));
    });
    test('phase coverage and savings target', () {
      expect(m.byPhase, isNotEmpty);
      expect(m.byPhase.every((r) => r.cost > 0), isTrue);
      final st = m.savingsTarget!;
      expect(st.target, 11904); // de-blocked-account
      expect(st.provenance, isNotNull);
      expect(st.dueYear, greaterThan(roadmap.todayYear));
    });
    test('scholarships: every funding doc of the corridor with a fit score and eligibility checks', () {
      expect(m.scholarships.length, content.funding.length);
      expect(m.scholarships.every((s) => s.fit >= 3 && s.fit <= 97), isTrue);
      final epos = m.scholarships.firstWhere((s) => s.funding.id == 'daad-epos');
      expect(epos.checks.any((c) => c.$1.startsWith('24 months')), isTrue);
      expect(epos.inPlan, isFalse);
    });
    test('a scholarship in the plan adds funds over the study years', () {
      final withPlan = FinanceModel.build(
        roadmap: RoadmapModel.build(goal: goal, plan: plan, content: content, now: now, progress: {'funding': {'daad-epos': true}}),
        profile: profile,
      );
      expect(withPlan.totalFunds, greaterThan(m.totalFunds));
      expect(withPlan.sources.any((s) => s.fundingId == 'daad-epos' && s.source == FundSource.scholarship), isTrue);
    });
  });
}
