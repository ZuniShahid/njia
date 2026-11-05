// View model between the engine plan and the cockpit/roadmap screens. Pure Dart, no Flutter.
// It groups engine steps into phases (prototype p1…p6), lays them on a year axis, derives the
// next milestone, this week's tasks, deadlines, drivers and the next best action – all from
// the plan and the content bundle, nothing hand-written.
import 'dart:math' as math;

import '../models/models.dart';
import 'engine.dart';

/// 0 = not started, 1 = in progress, 2 = done (prototype `mk miss/prog/ok`).
typedef StepStatus = int;

class RoadmapPhase {
  const RoadmapPhase({required this.index, required this.name, required this.start, required this.end, required this.steps, this.isMove = false, this.isGoal = false});
  final int index; // 1-based, colour p{index}
  final String name;
  final double start; // fractional year
  final double end;
  final List<RoadmapStep> steps;
  final bool isMove;
  final bool isGoal;
  String get shortName => name.split(' · ').first;
}

class RoadmapStep {
  const RoadmapStep({required this.key, required this.number, required this.phaseIndex, required this.title, required this.subtitle, required this.barLabel, required this.start, required this.end, required this.kind, this.step, this.optional = false});
  final String key; // stable id for progress
  final int number;
  final int phaseIndex;
  final String title;
  final String subtitle;
  final String barLabel;
  final double start;
  final double end;
  final String kind;
  final PlanStep? step; // null for the synthetic grow and goal steps
  final bool optional;
}

class RoadmapDecision {
  const RoadmapDecision({required this.id, required this.year, required this.phaseIndex, required this.title, required this.body, required this.options});
  final String id;
  final String year;
  final int phaseIndex;
  final String title;
  final String body;
  final List<String> options;
}

class RoadmapDeadline {
  const RoadmapDeadline({required this.date, required this.title, required this.caption, this.stepKey});
  final DateTime date;
  final String title;
  final String caption;
  final String? stepKey;
}

class RoadmapDriver {
  const RoadmapDriver(this.positive, this.text);
  final bool positive;
  final String text;
}

class RoadmapModel {
  RoadmapModel._({
    required this.goal,
    required this.plan,
    required this.content,
    required this.progress,
    required this.now,
    required this.phases,
    required this.steps,
    required this.axisStart,
    required this.axisEnd,
  });

  final Goal goal;
  final Plan plan;
  final ContentBundle content;
  final Map<String, dynamic> progress; // users/{uid}.progress[goalId]
  final DateTime now;
  final List<RoadmapPhase> phases;
  final List<RoadmapStep> steps;
  final double axisStart;
  final double axisEnd;

  static const _kindLabel = {'prepare': 'Prepare', 'apply': 'Apply', 'visa': 'Visa', 'study': 'Study', 'work': 'Work'};

  /// Stable key for a plan step (plans have no ids): kind + the content id it points at.
  static String stepKey(PlanStep s) => '${s.kind}:${s.requirementId ?? s.pathwayId ?? s.permitId ?? s.order}';

  static double yearOf(DateTime d) => d.year + (d.month - 1) / 12 + (d.day - 1) / 365;

  factory RoadmapModel.build({required Goal goal, required Plan plan, required ContentBundle content, Map<String, dynamic>? progress, DateTime? now}) {
    final at = now ?? DateTime.now();
    final y0 = yearOf(at);
    double y(int month) => y0 + month / 12;

    final pathwayById = {for (final p in content.pathways) p.id: p};
    final countryName = content.countries.where((c) => c.id == goal.countryId).firstOrNull?.name.en ?? goal.countryId ?? '';
    final phases = <RoadmapPhase>[];
    final all = <RoadmapStep>[];
    var n = 0;

    RoadmapStep make(PlanStep s, int phaseIndex, {String? title, String? subtitle, String? bar}) {
      n++;
      final st = RoadmapStep(
        key: stepKey(s),
        number: n,
        phaseIndex: phaseIndex,
        title: title ?? s.title,
        subtitle: subtitle ?? _subtitle(s, pathwayById, countryName),
        barLabel: bar ?? _bar(s),
        start: y(s.startMonth),
        end: y(s.startMonth + (s.durationMonths ?? 1)),
        kind: s.kind,
        step: s,
      );
      all.add(st);
      return st;
    }

    // Phase 1: preparation (all prepare steps run in parallel from month 0)
    final prep = plan.steps.where((s) => s.kind == PlanStepKind.prepare).toList();
    if (prep.isNotEmpty) {
      final ps = prep.map((s) => make(s, 1)).toList();
      phases.add(RoadmapPhase(index: 1, name: 'Prepare · Freetown', start: ps.map((s) => s.start).reduce(math.min), end: ps.map((s) => s.end).reduce(math.max), steps: ps));
    }
    // One phase per pathway: apply + entry visa + study/work (+ follow-on permit)
    var movePlaced = false;
    final rest = plan.steps.where((s) => s.kind != PlanStepKind.prepare).toList();
    final byPathway = <String?, List<PlanStep>>{};
    String? current;
    for (final s in rest) {
      if (s.kind == PlanStepKind.apply) current = s.pathwayId;
      byPathway.putIfAbsent(current, () => []).add(s);
    }
    for (final entry in byPathway.entries) {
      final pw = pathwayById[entry.key];
      final idx = phases.length + 1;
      final isStudy = entry.value.any((s) => s.kind == PlanStepKind.study);
      final hasVisa = entry.value.any((s) => s.kind == PlanStepKind.visa && s.applyAt != null);
      final name = !movePlaced && hasVisa
          ? 'Move to $countryName · ${pw?.title ?? ''}'
          : '${isStudy ? 'Study' : 'Work'} · ${pw?.city ?? countryName}';
      if (!movePlaced && hasVisa) movePlaced = true;
      final ps = entry.value.map((s) => make(s, idx)).toList();
      phases.add(RoadmapPhase(index: idx, name: name, start: ps.map((s) => s.start).reduce(math.min), end: ps.map((s) => s.end).reduce(math.max), steps: ps, isMove: name.startsWith('Move')));
    }
    // Goal phase: from the end of the last step to the target year
    final lastEnd = all.isEmpty ? y0 : all.map((s) => s.end).reduce(math.max);
    final target = (goal.targetYear ?? lastEnd.ceil()).toDouble();
    final goalStart = math.max(lastEnd, target - 0.6);
    // Grow phase: the engine plans the route into the country; the years between the last planned
    // step and the goal become career steps the student fills in (no facts, no numbers).
    if (goalStart - lastEnd >= 1) {
      final idx = phases.length + 1;
      final hasWork = plan.steps.any((s) => s.kind == PlanStepKind.work);
      final firstEnd = hasWork ? lastEnd : math.min(lastEnd + 3, lastEnd + (goalStart - lastEnd) / 2);
      final grow = <RoadmapStep>[
        if (!hasWork)
          RoadmapStep(key: 'grow:first-job', number: ++n, phaseIndex: idx, title: 'First job in $countryName', subtitle: 'Entry role in your field', barLabel: 'Work · ${_years(firstEnd - lastEnd)}', start: lastEnd, end: firstEnd, kind: 'grow'),
        RoadmapStep(key: 'grow:experience', number: ++n, phaseIndex: idx, title: 'Grow towards ${goal.title ?? 'your goal'}', subtitle: 'More responsibility, step by step', barLabel: 'Experience · ${_years(goalStart - firstEnd)}', start: firstEnd, end: goalStart, kind: 'grow'),
      ];
      all.addAll(grow);
      phases.add(RoadmapPhase(index: idx, name: 'Grow · $countryName', start: lastEnd, end: goalStart, steps: grow));
    }
    n++;
    final goalStep = RoadmapStep(key: 'goal', number: n, phaseIndex: phases.length + 1, title: goal.title ?? 'Your goal', subtitle: [goal.employer, goal.area].where((x) => x != null && x.isNotEmpty).join(' · '), barLabel: 'Goal', start: goalStart, end: math.max(goalStart + 0.5, target + 0.95), kind: 'goal');
    all.add(goalStep);
    phases.add(RoadmapPhase(index: phases.length + 1, name: 'Goal', start: goalStep.start, end: goalStep.end, steps: [goalStep], isGoal: true));

    return RoadmapModel._(
      goal: goal,
      plan: plan,
      content: content,
      progress: progress ?? const {},
      now: at,
      phases: phases,
      steps: all,
      axisStart: at.year.toDouble(),
      axisEnd: goalStep.end + 0.3,
    );
  }

  static String _subtitle(PlanStep s, Map<String, Pathway> pathways, String country) {
    switch (s.kind) {
      case PlanStepKind.prepare:
        return s.status == 'unknown' ? 'Not checked yet' : 'Requirement to meet';
      case PlanStepKind.apply:
        final d = s.deadline;
        return d == null ? 'Application' : 'Deadline $d';
      case PlanStepKind.visa:
        final at = s.applyAt;
        return at == null ? (s.note ?? 'Residence permit') : 'Apply in ${at.city} (${at.country})';
      case PlanStepKind.study:
        return [s.institution, s.city].where((x) => x != null && x.isNotEmpty).join(' · ');
      case PlanStepKind.work:
        return [s.institution, s.city].where((x) => x != null && x.isNotEmpty).join(' · ');
    }
    return '';
  }

  static String _years(double y) => y >= 1.95 ? '${y.round()} years' : y >= 0.95 ? '${y.toStringAsFixed(1)} yr' : '${(y * 12).round()} mo';

  static String _bar(PlanStep s) {
    final d = s.durationMonths ?? 0;
    final dur = d >= 24 && d % 12 == 0 ? '${d ~/ 12} years' : d >= 12 ? '${(d / 12).toStringAsFixed(d % 12 == 0 ? 0 : 1)} yr' : '$d mo';
    return '${_kindLabel[s.kind] ?? s.kind} · $dur';
  }

  // ---- axis -------------------------------------------------------------------------------------
  double px(double year) => ((year - axisStart) / (axisEnd - axisStart)).clamp(0, 1);
  List<int> get ticks => [for (var yy = axisStart.floor(); yy <= axisEnd - 0.6; yy += 2) yy];
  double get todayYear => yearOf(now);

  // ---- progress ---------------------------------------------------------------------------------
  Map<String, dynamic> get _steps => Map<String, dynamic>.from(progress['steps'] as Map? ?? const {});
  StepStatus statusOf(RoadmapStep s) {
    final v = _steps[s.key];
    if (v is num) return v.toInt().clamp(0, 2);
    // engine knowledge: a prepare step whose requirement is already met does not appear, so default 0;
    // the first study/work step is "in progress" once its start is in the past
    return s.start <= todayYear && s.end > todayYear && s.kind != PlanStepKind.prepare ? 1 : 0;
  }

  bool isDone(RoadmapStep s) => statusOf(s) == 2;
  int get stepsDone => steps.where((s) => s.kind != 'goal' && isDone(s)).length;
  int get stepsTotal => steps.where((s) => s.kind != 'goal').length;

  RoadmapPhase get currentPhase => phases.firstWhere((p) => p.steps.any((s) => !isDone(s)), orElse: () => phases.last);

  Map<String, dynamic> get decisionsChosen => Map<String, dynamic>.from(progress['decisions'] as Map? ?? const {});
  Map<String, dynamic> get whereChosen => Map<String, dynamic>.from(progress['where'] as Map? ?? const {});

  // ---- cockpit ----------------------------------------------------------------------------------
  int get yearsToGoal => math.max(0, (goal.targetYear ?? now.year) - now.year);

  /// Next milestone = the first phase with open steps: its open steps are the checklist.
  ({String title, double due, List<RoadmapStep> items, int done, List<RoadmapStep> next}) get milestone {
    final ph = currentPhase;
    final items = ph.steps;
    final done = items.where(isDone).length;
    final next = items.where((s) => !isDone(s)).toList()..sort((a, b) => a.end.compareTo(b.end));
    return (title: ph.isMove ? ph.name : ph.shortName, due: ph.end, items: items, done: done, next: next.take(3).toList());
  }

  /// "This week": the open steps that have started or start within 3 months, earliest first (max 5).
  List<RoadmapStep> get tasks {
    final horizon = todayYear + 0.25;
    final open = steps.where((s) => s.kind != 'goal' && !isDone(s) && s.start <= horizon).toList()..sort((a, b) => a.end.compareTo(b.end));
    return open.take(5).toList();
  }

  /// Deadlines from content: application deadlines and funding windows on the route, future only.
  List<RoadmapDeadline> get deadlines {
    final out = <RoadmapDeadline>[];
    for (final s in steps) {
      final ps = s.step;
      if (ps == null) continue;
      final d = ps.deadline == null ? null : parseDateUtc(ps.deadline!);
      if (d != null && d.isAfter(now)) out.add(RoadmapDeadline(date: d, title: ps.title, caption: 'Step ${s.number} · application deadline', stepKey: s.key));
      for (final f in ps.funding) {
        final c = f.closes == null ? null : parseDateUtc(f.closes!);
        if (c != null && c.isAfter(now)) out.add(RoadmapDeadline(date: c, title: f.name, caption: 'Step ${s.number} · funding closes', stepKey: s.key));
      }
    }
    out.sort((a, b) => a.date.compareTo(b.date));
    return out.take(5).toList();
  }

  /// Feasibility (= realism 0–100) and difficulty (1–5) with one-line readings.
  ({int feasibility, String feasibilityNote, double difficulty, String difficultyNote}) get chances {
    final r = plan.scores.realism;
    final d = plan.scores.difficulty;
    return (
      feasibility: r,
      feasibilityNote: r > 60 ? 'Realistic with steady work' : r > 40 ? 'Possible with a long runway' : 'Hard but not impossible',
      difficulty: d,
      difficultyNote: d >= 4 ? 'Selective route, several gaps' : d >= 3 ? 'Competitive route' : 'Well-trodden route',
    );
  }

  List<RoadmapDriver> get drivers {
    final out = <RoadmapDriver>[];
    final gaps = plan.gaps.where((g) => g.status == 'gap').length;
    final unknown = plan.gaps.where((g) => g.status == 'unknown').length;
    out.add(gaps == 0 ? const RoadmapDriver(true, 'No known requirement gaps') : RoadmapDriver(false, '$gaps requirement${gaps == 1 ? '' : 's'} not met yet'));
    if (unknown > 0) out.add(RoadmapDriver(false, '$unknown requirement${unknown == 1 ? '' : 's'} not checked yet – fill your profile'));
    final cov = plan.scores.financeCoverage;
    if (cov != null) out.add(cov >= 80 ? RoadmapDriver(true, 'Money covers $cov% of the route') : RoadmapDriver(false, 'Money covers $cov% of the route so far'));
    for (final w in plan.watch.where((w) => w.kind == 'language')) {
      out.add(RoadmapDriver(false, w.text));
    }
    return out.take(4).toList();
  }

  /// First open prepare step with a how-to text (prototype "Next best action").
  ({String title, String body, RoadmapStep? step})? get nextBestAction {
    final s = steps.where((s) => s.kind == PlanStepKind.prepare && !isDone(s)).firstOrNull ?? steps.where((s) => s.kind != 'goal' && !isDone(s)).firstOrNull;
    if (s == null) return null;
    final req = s.step?.requirementId == null ? null : content.requirements.where((r) => r.id == s.step!.requirementId).firstOrNull;
    return (title: s.title, body: s.step?.howToMeet ?? req?.howToMeet?.en ?? 'Open the step on the roadmap to see what it takes.', step: s);
  }

  // ---- roadmap ----------------------------------------------------------------------------------
  /// Decision points that exist in the content: alternative programmes of the same type in the
  /// country, and which funding to apply for.
  List<RoadmapDecision> get decisions {
    final out = <RoadmapDecision>[];
    for (final s in steps) {
      final ps = s.step;
      if (ps == null || ps.pathwayId == null) continue;
      final pw = content.pathways.where((p) => p.id == ps.pathwayId).firstOrNull;
      if (pw == null) continue;
      if (ps.kind == PlanStepKind.study) {
        final alts = content.pathways.where((p) => p.id != pw.id && p.countryId == pw.countryId && p.type == pw.type && p.status != PathwayStatus.withdrawn).take(2).toList();
        if (alts.isNotEmpty) {
          out.add(RoadmapDecision(
            id: 'pathway:${pw.id}',
            year: s.start.floor().toString(),
            phaseIndex: s.phaseIndex,
            title: 'Which programme for step ${s.number}?',
            body: 'The roadmap assumes ${pw.title}${pw.institution == null ? '' : ' at ${pw.institution}'}. Alternatives in ${pw.countryId} with the same level exist; compare language, fees and deadlines.',
            options: [pw.title, ...alts.map((a) => a.title)],
          ));
        }
      }
      if (ps.kind == PlanStepKind.apply && ps.funding.length > 1) {
        out.add(RoadmapDecision(
          id: 'funding:${pw.id}',
          year: s.start.floor().toString(),
          phaseIndex: s.phaseIndex,
          title: 'Which funding first?',
          body: 'Scholarships have different windows and eligibility. Pick the one to prepare first; the others stay as backup.',
          options: ps.funding.take(3).map((f) => f.name).toList(),
        ));
      }
    }
    return out;
  }
}
