// Njia planning engine – Dart port of functions/src/engine.mjs. Pure functions, no Flutter or
// Firebase imports. Keep in sync with the JS file: the server plan (users/{uid}/plans/{goalId})
// is canonical; this port exists for instant/offline previews when the student ticks a
// requirement, changes money or changes the move year.
//
// Input: content documents + user profile + goal. Output: plan + scores.
import 'dart:math' as math;

import '../models/models.dart';
import 'content_bundle.dart';

export 'content_bundle.dart';

const List<String> cefrLevels = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];

/// Index of a CEFR level (A1 = 0 … C2 = 5), -1 if unknown. Same as `cefrIdx` in engine.mjs.
int cefrIdx(Object? v) => cefrLevels.indexOf(v.toString().toUpperCase());

/// Result of matching one requirement against the profile facts.
enum RequirementStatus { met, gap, unknown }

class RequirementResult {
  const RequirementResult(this.id, this.status);
  final String id;
  final RequirementStatus status;

  @override
  String toString() => 'RequirementResult($id, ${status.name})';
}

/// Evaluate one requirement against profile facts. `facts` is a flat map like
/// `{"language.en.ielts": 6.5}`.
RequirementResult evaluateRequirement(Requirement req, Map<String, Object?> facts) {
  final have = facts[req.key];
  if (have == null) return RequirementResult(req.id, RequirementStatus.unknown);
  final want = req.value;
  bool met;
  switch (req.operator) {
    case RequirementOperator.exists:
      met = _truthy(have);
    case RequirementOperator.eq:
      met = have == want;
    case RequirementOperator.inList:
      met = want is List && want.contains(have);
    case RequirementOperator.gte:
    case RequirementOperator.lte:
      final isCefr = want is String && cefrLevels.contains(want.toUpperCase());
      final num a = isCefr ? cefrIdx(have) : _toNum(have);
      final num b = isCefr ? cefrIdx(want) : _toNum(want);
      if (a.isNaN || a < 0) return RequirementResult(req.id, RequirementStatus.unknown);
      met = req.operator == RequirementOperator.gte ? a >= b : a <= b;
    case null:
      return RequirementResult(req.id, RequirementStatus.unknown);
  }
  return RequirementResult(req.id, met ? RequirementStatus.met : RequirementStatus.gap);
}

/// Readiness 0–100 for a set of requirement ids. Unknown counts half.
({int score, List<RequirementResult> results}) readinessScore(
  Iterable<String> reqIds,
  Map<String, Requirement> reqById,
  Map<String, Object?> facts,
) {
  final results = reqIds
      .map((id) => reqById[id])
      .whereType<Requirement>()
      .map((r) => evaluateRequirement(r, facts))
      .toList();
  if (results.isEmpty) return (score: 100, results: results);
  final pts = results.fold<double>(
    0,
    (s, r) => s + switch (r.status) { RequirementStatus.met => 1, RequirementStatus.unknown => 0.5, RequirementStatus.gap => 0 },
  );
  return (score: (100 * pts / results.length).round(), results: results);
}

const List<PathwayType> _phaseOrder = [
  PathwayType.test,
  PathwayType.languageCourse,
  PathwayType.course,
  PathwayType.bachelor,
  PathwayType.vocational,
  PathwayType.master,
  PathwayType.phd,
  PathwayType.internship,
  PathwayType.trainee,
  PathwayType.job,
];

int _monthsOf(Pathway p) {
  final d = p.durationMonths;
  if (d != null && d != 0) return d;
  return p.type == PathwayType.test ? 1 : 12;
}

/// Pick the pathways that form the route to the goal. Explicit `goal.pathwayIds` win; otherwise infer.
List<Pathway> selectPathways(Goal goal, ContentBundle content) {
  final all = content.pathways.where((p) => p.status != PathwayStatus.withdrawn).toList();
  if (goal.pathwayIds.isNotEmpty) {
    return goal.pathwayIds.map((id) => all.where((p) => p.id == id).firstOrNull).whereType<Pathway>().toList();
  }
  final inCountry = all.where((p) => p.countryId == goal.countryId).toList();
  final leads = inCountry.where((p) => p.leadsToOccupationIds.contains(goal.occupationId)).toList();
  // prefer one study pathway + one job/trainee pathway
  final study = leads.where((p) => const [PathwayType.master, PathwayType.bachelor, PathwayType.vocational].contains(p.type)).firstOrNull ??
      inCountry.where((p) => const [PathwayType.master, PathwayType.bachelor].contains(p.type)).firstOrNull;
  final work = leads.where((p) => const [PathwayType.trainee, PathwayType.job].contains(p.type)).firstOrNull;
  return [study, work].whereType<Pathway>().toList();
}

/// The requirement ids a route depends on: every requirement of the chosen pathways plus those of
/// the first pathway's student permit (same set the server uses for readiness).
Set<String> neededRequirementIds(List<Pathway> pathways, Map<String, ResidencePermit> permitById) {
  final ids = <String>{};
  for (final p in pathways) {
    ids.addAll(p.requirementIds);
  }
  final firstPermit = pathways.firstOrNull?.unlocksPermitIds
      .map((id) => permitById[id])
      .where((p) => p != null && p.type == PermitType.student)
      .firstOrNull;
  if (firstPermit != null) ids.addAll(firstPermit.requirementIds);
  return ids;
}

/// Build the plan: steps (with month offsets), costs, requirement gaps, scores.
Plan buildPlan({
  required Goal goal,
  required UserProfile profile,
  required ContentBundle content,
  DateTime? now,
}) {
  final at = now ?? DateTime.now();
  final reqById = {for (final r in content.requirements) r.id: r};
  final permitById = {for (final r in content.residencePermits) r.id: r};
  final fundingById = {for (final r in content.funding) r.id: r};
  final facts = Map<String, Object?>.from(profile.facts ?? const {});
  final origin = profile.nationality ?? 'SL';
  final corridor = content.corridors.where((c) => c.origin == origin && c.destination == goal.countryId).firstOrNull;
  final country = content.countries.where((c) => c.id == goal.countryId).firstOrNull;

  final pathways = selectPathways(goal, content)
    ..sort((a, b) => _phaseOrder.indexOf(a.type).compareTo(_phaseOrder.indexOf(b.type)));
  final steps = <PlanStep>[];
  var month = 0;
  void pushStep(PlanStep s) => steps.add(s.copyWith(order: steps.length + 1, startMonth: month));

  // 1. Preparation: every requirement of the pathways (+ first student permit) that is a gap or unknown
  final neededReqIds = neededRequirementIds(pathways, permitById);
  final evals = neededReqIds
      .map((id) => reqById[id])
      .whereType<Requirement>()
      .map((r) => (result: evaluateRequirement(r, facts), req: r))
      .toList();
  final gaps = evals.where((e) => e.result.status != RequirementStatus.met).toList();
  for (final g in gaps) {
    final req = g.req;
    final int dur;
    if (req.type == RequirementType.languageTest && req.cefr != null && cefrIdx(req.cefr!.value) >= 3) {
      dur = 9;
    } else if (req.type == RequirementType.languageTest) {
      dur = 4;
    } else if (req.type == RequirementType.funds) {
      dur = 6;
    } else {
      dur = 2;
    }
    pushStep(PlanStep(
      order: 0,
      startMonth: 0,
      kind: PlanStepKind.prepare,
      title: req.label.en.isNotEmpty ? req.label.en : req.id,
      requirementId: req.id,
      durationMonths: dur,
      status: g.result.status.name,
      howToMeet: _nonEmpty(req.howToMeet?.en),
      providerTypes: req.providerTypes,
    ));
  }
  // preparation runs in parallel
  month += gaps.isEmpty ? 0 : steps.take(gaps.length).map((s) => s.durationMonths ?? 0).reduce(math.max);

  // 2. Pathways in order, each with admission + permit + study/work block
  final costs = <PlanCost>[];
  for (final p in pathways) {
    final fundingOpts = p.fundingIds.map((id) => fundingById[id]).whereType<Funding>().toList();
    pushStep(PlanStep(
      order: 0,
      startMonth: 0,
      kind: PlanStepKind.apply,
      title: 'Apply: ${p.title}',
      pathwayId: p.id,
      durationMonths: 3,
      deadline: p.applicationDeadline,
      funding: [
        for (final f in fundingOpts)
          PlanFundingOption(id: f.id, name: f.name, difficulty: f.difficulty, closes: f.applicationWindow?.closes),
      ],
    ));
    month += 3;
    final permits = p.unlocksPermitIds.map((id) => permitById[id]).whereType<ResidencePermit>().toList();
    final entryPermit = permits
        .where((x) => const [PermitType.student, PermitType.work, PermitType.blueCard, PermitType.trainee].contains(x.type))
        .firstOrNull;
    if (entryPermit != null) {
      final weeks = _positive(entryPermit.processingWeeks?.max) ?? 8;
      final months = (weeks / 4).ceil();
      pushStep(PlanStep(
        order: 0,
        startMonth: 0,
        kind: PlanStepKind.visa,
        title: _permitTitle(entryPermit),
        permitId: entryPermit.id,
        durationMonths: months,
        applyAt: corridor?.visaApplication,
        checklist: entryPermit.checklist,
        fee: entryPermit.fee,
        fundsProof: entryPermit.fundsProof,
      ));
      month += months;
      final fee = entryPermit.fee;
      if (fee != null) {
        costs.add(PlanCost(
          label: '${_permitTitle(entryPermit)} fee',
          amount: fee.amount,
          currency: fee.currency,
          period: fee.period,
          kind: PlanCostKind.fee,
          month: month,
        ));
      }
    }
    final dur = _monthsOf(p);
    pushStep(PlanStep(
      order: 0,
      startMonth: 0,
      kind: p.type == PathwayType.job || p.type == PathwayType.trainee ? PlanStepKind.work : PlanStepKind.study,
      title: p.title,
      pathwayId: p.id,
      durationMonths: dur,
      institution: p.institution,
      city: p.city,
    ));
    final tuition = p.tuition;
    if (tuition != null && tuition.max > 0) {
      final years = tuition.period == MoneyPeriod.once ? 1 : math.max(1, (dur / 12).round());
      costs.add(PlanCost(
        label: 'Tuition: ${p.title}',
        min: tuition.min * years,
        max: tuition.max * years,
        currency: tuition.currency,
        kind: PlanCostKind.tuition,
        month: month,
      ));
    }
    final living = country?.livingCostMonthly;
    if (living != null &&
        p.type != PathwayType.job &&
        p.type != PathwayType.trainee &&
        p.type != PathwayType.test &&
        p.mode != PathwayMode.online) {
      costs.add(PlanCost(
        label: 'Living costs ${country?.name.en} ($dur months)',
        min: living.min * dur,
        max: living.max * dur,
        currency: living.currency,
        kind: PlanCostKind.living,
        month: month,
      ));
    }
    month += dur;
    final follow = permits.where((x) => x.type == PermitType.jobSeeker).firstOrNull;
    if (follow != null && p.type != PathwayType.job) {
      pushStep(PlanStep(
        order: 0,
        startMonth: 0,
        kind: PlanStepKind.visa,
        title: _permitTitle(follow),
        permitId: follow.id,
        durationMonths: _positive(follow.durationMonths) ?? 12,
        note: 'Time to find a job after graduation',
      ));
    }
  }

  // 3. Scores
  final readiness = readinessScore(neededReqIds, reqById, facts).score;
  final fundingDiff = pathways
      .expand((p) => p.fundingIds.map((id) => fundingById[id]?.difficulty))
      .where((d) => d != null && d != 0)
      .cast<int>()
      .toList();
  final difficulty = _clamp(
    0.4 * (_positive(corridor?.scoreBase?.difficulty) ?? 3) +
        0.3 * (fundingDiff.isNotEmpty ? fundingDiff.reduce(math.min) : 3) +
        0.3 * math.min(5, 1 + gaps.length / 2),
    1,
    5,
  );
  final totalMinEur = costs.where((c) => c.currency == 'EUR').fold<double>(0, (s, c) => s + (c.min ?? c.amount ?? 0));
  final savings = profile.savings?.currency == 'EUR' ? profile.savings!.amount : 0.0;
  final support = profile.monthlySupport?.currency == 'EUR' ? profile.monthlySupport!.amount * math.max(month, 1) : 0.0;
  final coverage = totalMinEur != 0 ? _clamp((savings + support) / totalMinEur, 0, 1) : 1.0;
  final targetYear = _positive(goal.targetYear);
  final yearsLeft = targetYear == null ? null : targetYear - at.year;
  final timeFit = yearsLeft == null ? 1.0 : _clamp((yearsLeft * 12) / math.max(month, 1), 0, 1);
  final realism = (100 * (0.4 * readiness / 100 + 0.25 * (1 - (difficulty - 1) / 4) + 0.2 * coverage + 0.15 * timeFit)).round();

  return Plan(
    id: goal.id,
    goalId: goal.id,
    corridorId: corridor?.id,
    pathwayIds: pathways.map((p) => p.id).toList(),
    steps: steps,
    totalMonths: month,
    costs: costs,
    gaps: [
      for (final g in gaps) PlanGap(requirementId: g.req.id, status: g.result.status.name, label: g.req.label.en),
    ],
    scores: PlanScores(
      readiness: readiness,
      difficulty: (difficulty * 10).round() / 10,
      realism: realism,
      financeCoverage: (coverage * 100).round(),
    ),
    watch: _watchItems(corridor: corridor, country: country, pathways: pathways, fundingById: fundingById, now: at),
    computedAt: at.toUtc().toIso8601String(),
  );
}

List<WatchItem> _watchItems({
  required Corridor? corridor,
  required Country? country,
  required List<Pathway> pathways,
  required Map<String, Funding> fundingById,
  required DateTime now,
}) {
  final items = <WatchItem>[];
  final visa = corridor?.visaApplication;
  if (visa != null && visa.travelRequired == true) {
    items.add(WatchItem(
      kind: 'visa',
      text: 'Visa applications are lodged in ${visa.city} (${visa.country}); plan travel and an appointment.',
    ));
  }
  if (country != null && country.languages.isNotEmpty && !country.languages.contains('en')) {
    items.add(WatchItem(
      kind: 'language',
      text: 'Daily life in ${country.name.en} runs in ${country.languages.first}; English-taught programmes still expect basics.',
    ));
  }
  for (final p in pathways) {
    for (final id in p.fundingIds) {
      final f = fundingById[id];
      final closes = f?.applicationWindow?.closes;
      final closesAt = closes == null ? null : parseDateUtc(closes);
      if (f != null && closes != null && closesAt != null && closesAt.isAfter(now) && closesAt.difference(now).inMilliseconds / 864e5 < 120) {
        items.add(WatchItem(kind: 'deadline', text: '${f.name} closes on $closes.', fundingId: id));
      }
    }
  }
  return items;
}

/// Flatten a user profile document into the facts map requirements are matched against.
Map<String, Object?> factsFromProfile(UserProfile user) {
  final facts = <String, Object?>{...?user.facts};
  for (final l in user.languages) {
    if (l.cefr != null) facts['language.${l.lang}.cefr'] = l.cefr!.value;
    if (l.test == 'IELTS' && _truthy(l.score)) facts['language.en.ielts'] = _toNum(l.score);
  }
  final edu = user.education;
  final done = edu.where((e) => e.status == UserEducationStatus.completed).toList();
  if (done.isNotEmpty) {
    // JS: Math.max(...done.map(Number(e.isced))) – NaN if any entry has no level.
    final levels = done.map<num>((e) => e.isced == null ? double.nan : int.parse(e.isced!.value)).toList();
    facts['education.maxIsced'] = levels.any((v) => v.isNaN) ? double.nan : levels.reduce(math.max);
  }
  final wassce = edu.where((e) => RegExp('wassce', caseSensitive: false).hasMatch(e.gradeScale ?? '')).firstOrNull;
  if (_truthy(wassce?.grade)) facts['education.wassce.credits'] = _toNum(wassce!.grade);
  final bach = done.where((e) => e.isced == Isced.level6).firstOrNull;
  if (_truthy(bach?.grade)) facts['education.bachelor.classification'] = bach!.grade;
  if (user.experienceMonths != null) facts['experienceMonths'] = user.experienceMonths;
  final savings = user.savings;
  if (savings?.currency == 'EUR') facts['funds.eur'] = savings!.amount;
  if (savings?.currency == 'GBP') facts['funds.gbp'] = savings!.amount;
  return facts;
}

/// Parses an ISO date. A bare `YYYY-MM-DD` is read as UTC midnight (like JS `new Date("2026-10-15")`).
DateTime? parseDateUtc(String s) {
  final m = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(s);
  if (m != null) return DateTime.utc(int.parse(m[1]!), int.parse(m[2]!), int.parse(m[3]!));
  return DateTime.tryParse(s)?.toUtc();
}

// ---- JS-compatible helpers ---------------------------------------------------------------------

String _permitTitle(ResidencePermit p) => p.name.en.isNotEmpty ? p.name.en : p.id;

String? _nonEmpty(String? s) => (s == null || s.isEmpty) ? null : s;

/// `x || null` for numbers: null and 0 are falsy.
int? _positive(int? v) => (v == null || v == 0) ? null : v;

double _clamp(num v, num lo, num hi) => math.min(hi, math.max(lo, v)).toDouble();

/// JS truthiness for the values that reach the engine.
bool _truthy(Object? v) {
  if (v == null) return false;
  if (v is bool) return v;
  if (v is num) return v != 0 && !v.isNaN;
  if (v is String) return v.isNotEmpty;
  return true;
}

/// JS `Number(v)` for the value types that occur in facts and profiles.
/// Note: a missing value is NaN here (JS `undefined`), not 0 (JS `null`).
num _toNum(Object? v) {
  if (v == null) return double.nan;
  if (v is num) return v;
  if (v is bool) return v ? 1 : 0;
  if (v is String) {
    final t = v.trim();
    if (t.isEmpty) return 0;
    return num.tryParse(t) ?? double.nan;
  }
  return double.nan;
}
