// RoadmapModel over the real seed plan (SL → DE, Frankfurt School + Deutsche Bank).
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/core/engine/engine.dart';
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
  final content = ContentBundle.fromJsonLists({
    for (final c in ['countries', 'corridors', 'pathways', 'requirements', 'residencePermits', 'funding', 'occupations']) c: load(c),
  });
  final now = DateTime.utc(2026, 11, 2);
  final goal = sampleGoals.first;
  final plan = buildPlan(goal: goal, profile: sampleProfile.copyWith(facts: factsFromProfile(sampleProfile)), content: content, now: now);

  test('phases: prepare, move + study, work, goal – in time order', () {
    final m = RoadmapModel.build(goal: goal, plan: plan, content: content, now: now);
    expect(m.phases.first.name, 'Prepare · Freetown');
    expect(m.phases.any((p) => p.isMove && p.name.startsWith('Move to Germany')), isTrue);
    expect(m.phases.last.isGoal, isTrue);
    expect(m.phases.last.end, greaterThanOrEqualTo(2042));
    for (var i = 1; i < m.phases.length; i++) {
      expect(m.phases[i].start, greaterThanOrEqualTo(m.phases[i - 1].start), reason: 'phase order');
    }
    expect(m.steps.map((s) => s.number).toList(), List.generate(m.steps.length, (i) => i + 1));
    expect(m.steps.where((s) => s.kind == 'goal').length, 1);
    expect(m.stepsTotal, plan.steps.length);
  });

  test('axis spans today → goal and places today at the left edge', () {
    final m = RoadmapModel.build(goal: goal, plan: plan, content: content, now: now);
    expect(m.px(m.todayYear), closeTo(0.03, 0.03));
    expect(m.px(m.axisEnd), 1);
    expect(m.ticks.first, 2026);
  });

  test('milestone, tasks, deadlines and next best action come from the plan', () {
    final m = RoadmapModel.build(goal: goal, plan: plan, content: content, now: now);
    final ms = m.milestone;
    expect(ms.title, 'Prepare');
    expect(ms.done, 0);
    expect(ms.next.length, 3);
    expect(m.tasks, isNotEmpty);
    expect(m.tasks.every((s) => s.kind == PlanStepKind.prepare), isTrue);
    expect(m.nextBestAction, isNotNull);
    expect(m.nextBestAction!.body, isNotEmpty);
    expect(m.deadlines.every((d) => d.date.isAfter(now)), isTrue);
    expect(m.drivers.first.text, contains('requirement'));
  });

  test('progress changes status, done counts and the current phase', () {
    final base = RoadmapModel.build(goal: goal, plan: plan, content: content, now: now);
    final prepKeys = base.phases.first.steps.map((s) => s.key).toList();
    final m = RoadmapModel.build(goal: goal, plan: plan, content: content, now: now, progress: {'steps': {for (final k in prepKeys) k: 2}});
    expect(m.stepsDone, prepKeys.length);
    expect(m.currentPhase.index, 2);
    expect(m.milestone.title, startsWith('Move to Germany'));
  });

  test('decision points exist only where the content has alternatives', () {
    final m = RoadmapModel.build(goal: goal, plan: plan, content: content, now: now);
    // DE has one master pathway only, so no programme decision; the apply step has 3 funding options
    expect(m.decisions.where((d) => d.id.startsWith('pathway:')), isEmpty);
    expect(m.decisions.where((d) => d.id.startsWith('funding:')).length, 1);
    expect(m.decisions.first.options.length, 3);
  });
}
