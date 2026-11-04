// Finances screen model: costs and funds per year, totals, per-phase coverage, scholarship fit.
// Costs come from the plan (each one points at a content doc for its provenance); funds come from
// the profile (savings, monthly support), user-added sources and scholarships the student put in
// the plan. Pure Dart.
import 'dart:math' as math;

import '../models/models.dart';
import 'roadmap_model.dart';

enum FundSource { savings, family, work, scholarship, other }

class YearlyFunds {
  const YearlyFunds({required this.year, required this.costs, required this.funds, required this.cumulative, required this.bySource});
  final int year;
  final double costs;
  final double funds;
  final double cumulative;
  final Map<FundSource, double> bySource;
}

/// A money source over a year range (prototype "Your money").
class MoneySource {
  const MoneySource({required this.name, required this.source, required this.from, required this.to, required this.perYear, this.userIndex, this.fundingId});
  final String name;
  final FundSource source;
  final int from;
  final int to;
  final double perYear;

  /// Index in progress.money when the student added it (removable).
  final int? userIndex;
  final String? fundingId;
  double get total => perYear * (to - from + 1);
}

/// A cost line spread over years, with the content doc it comes from.
class CostLine {
  const CostLine({required this.label, required this.kind, required this.from, required this.to, required this.perYear, required this.currency, this.provenance});
  final String label;
  final String kind;
  final int from;
  final int to;
  final double perYear;
  final String currency;
  final Provenance? provenance;
  double get total => perYear * (to - from + 1);
}

class ScholarshipFit {
  const ScholarshipFit({required this.funding, required this.fit, required this.checks, required this.inPlan});
  final Funding funding;
  final int fit; // 0–100
  /// (label, status 0 missing / 1 unclear / 2 met)
  final List<(String, int)> checks;
  final bool inPlan;
}

class FinanceModel {
  FinanceModel._({required this.roadmap, required this.profile, required this.costs, required this.sources, required this.years, required this.perYear, required this.scholarships});

  final RoadmapModel roadmap;
  final UserProfile profile;
  final List<CostLine> costs;
  final List<MoneySource> sources;
  final List<int> years;
  final List<YearlyFunds> perYear;
  final List<ScholarshipFit> scholarships;

  double get totalCost => costs.fold(0, (s, c) => s + c.total);
  double get totalFunds => sources.where((s) => s.from <= years.last).fold(0, (s, x) => s + x.perYear * (math.min(x.to, years.last) - x.from + 1));
  double get gap => math.max(0, totalCost - totalFunds);
  int get coverage => totalCost == 0 ? 100 : math.min(100, (100 * totalFunds / totalCost).round());
  CostLine? get biggest => costs.isEmpty ? null : costs.reduce((a, b) => a.total >= b.total ? a : b);

  factory FinanceModel.build({required RoadmapModel roadmap, required UserProfile profile}) {
    final plan = roadmap.plan;
    final content = roadmap.content;
    final y0 = roadmap.now.year;
    int yearOfMonth(int m) => (RoadmapModel.yearOf(roadmap.now) + m / 12).floor();
    final country = content.countries.where((c) => c.id == roadmap.goal.countryId).firstOrNull;

    // ---- costs: spread each engine cost over the step it belongs to (match by start month + kind)
    final costs = <CostLine>[];
    for (final c in plan.costs) {
      PlanStep? step;
      for (final s in plan.steps) {
        if (c.kind == PlanCostKind.fee && s.kind == PlanStepKind.visa && s.startMonth + (s.durationMonths ?? 0) == c.month) step = s;
        if ((c.kind == PlanCostKind.tuition || c.kind == PlanCostKind.living) && (s.kind == PlanStepKind.study || s.kind == PlanStepKind.work) && s.startMonth == c.month) step = s;
      }
      final from = yearOfMonth(c.month);
      final months = c.kind == PlanCostKind.fee ? 1 : (step?.durationMonths ?? 12);
      final to = math.max(from, yearOfMonth(c.month + months - 1));
      final amount = c.min ?? c.amount ?? 0;
      Provenance? prov;
      if (c.kind == PlanCostKind.tuition) prov = content.pathways.where((p) => p.id == step?.pathwayId).firstOrNull?.provenance;
      if (c.kind == PlanCostKind.living) prov = country?.provenance;
      if (c.kind == PlanCostKind.fee) prov = content.residencePermits.where((p) => p.id == step?.permitId).firstOrNull?.provenance;
      costs.add(CostLine(label: c.label, kind: c.kind, from: from, to: to, perYear: amount / (to - from + 1), currency: c.currency, provenance: prov));
    }

    // ---- funds
    final lastYear = [y0 + 1, ...costs.map((c) => c.to), ...roadmap.phases.map((p) => p.end.floor())].reduce(math.max);
    final years = [for (var y = y0; y <= lastYear; y++) y];
    final sources = <MoneySource>[];
    if (profile.savings != null && profile.savings!.currency == 'EUR') {
      sources.add(MoneySource(name: 'Savings', source: FundSource.savings, from: y0, to: y0, perYear: profile.savings!.amount));
    }
    if (profile.monthlySupport != null && profile.monthlySupport!.currency == 'EUR' && profile.monthlySupport!.amount > 0) {
      sources.add(MoneySource(name: profile.supportSource?.isNotEmpty == true ? 'Support · ${profile.supportSource}' : 'Monthly support', source: FundSource.family, from: y0, to: lastYear, perYear: profile.monthlySupport!.amount * 12));
    }
    final progress = roadmap.progress;
    final extra = (progress['money'] as List?) ?? const [];
    for (final (i, e) in extra.indexed) {
      final m = Map<String, dynamic>.from(e as Map);
      sources.add(MoneySource(
        name: (m['name'] as String?) ?? 'Other',
        source: FundSource.values.where((s) => s.name == m['source']).firstOrNull ?? FundSource.other,
        from: (m['from'] as num?)?.toInt() ?? y0,
        to: (m['to'] as num?)?.toInt() ?? y0,
        perYear: ((m['perYear'] as num?) ?? 0).toDouble(),
        userIndex: i,
      ));
    }
    final inPlan = Map<String, dynamic>.from(progress['funding'] as Map? ?? const {});
    final studyStep = plan.steps.where((s) => s.kind == PlanStepKind.study).firstOrNull;
    final studyFrom = studyStep == null ? y0 + 1 : yearOfMonth(studyStep.startMonth);
    final studyTo = studyStep == null ? studyFrom : math.max(studyFrom, yearOfMonth(studyStep.startMonth + (studyStep.durationMonths ?? 12) - 1));
    for (final f in content.funding.where((f) => inPlan[f.id] == true)) {
      final a = f.amount;
      if (a == null || a.currency != 'EUR') continue;
      final perYear = switch (a.period) { MoneyPeriod.month => a.min * 12, MoneyPeriod.semester => a.min * 2, _ => a.min };
      final once = a.period == MoneyPeriod.once || a.period == null;
      sources.add(MoneySource(name: f.name, source: FundSource.scholarship, from: studyFrom, to: once ? studyFrom : studyTo, perYear: perYear, fundingId: f.id));
    }

    double at(Iterable<({int from, int to, double perYear})> list, int y) => list.fold(0, (s, x) => s + (y >= x.from && y <= x.to ? x.perYear : 0));
    var cum = 0.0;
    final per = <YearlyFunds>[];
    for (final y in years) {
      final c = at(costs.map((x) => (from: x.from, to: x.to, perYear: x.perYear)), y);
      final f = at(sources.map((x) => (from: x.from, to: x.to, perYear: x.perYear)), y);
      cum += f - c;
      per.add(YearlyFunds(
        year: y,
        costs: c,
        funds: f,
        cumulative: cum,
        bySource: {for (final s in FundSource.values) s: at(sources.where((x) => x.source == s).map((x) => (from: x.from, to: x.to, perYear: x.perYear)), y)},
      ));
    }

    // ---- scholarships (all funding docs of the corridor, with a fit score from eligibility)
    final iscedOnRoute = {for (final id in plan.pathwayIds) ...content.pathways.where((p) => p.id == id).map((p) => p.isced?.value)}.whereType<String>().toSet();
    final scholarships = <ScholarshipFit>[];
    for (final f in content.funding) {
      final e = f.eligibility;
      final checks = <(String, int)>[];
      var score = 40;
      final nats = e.nationalities;
      if (nats.isNotEmpty) {
        final ok = nats.contains(profile.nationality ?? 'SL') || nats.contains('any') || nats.contains('any_developing') || nats.contains('africa');
        checks.add(('Nationality: ${nats.join(', ')}', ok ? 2 : 0));
        score += ok ? 25 : -30;
      }
      if (e.isced.isNotEmpty) {
        final ok = e.isced.any((l) => iscedOnRoute.contains(l.value));
        checks.add(('Level: ISCED ${e.isced.map((l) => l.value).join('/')}', ok ? 2 : iscedOnRoute.isEmpty ? 1 : 0));
        score += ok ? 15 : -10;
      }
      if (e.minExperienceMonths != null) {
        final have = profile.experienceMonths;
        final st = have == null ? 1 : have >= e.minExperienceMonths! ? 2 : 0;
        checks.add(('${e.minExperienceMonths} months of work experience', st));
        score += st == 2 ? 10 : st == 0 ? -10 : 0;
      }
      if (e.maxAge != null) {
        final by = profile.birthYear;
        final st = by == null ? 1 : (roadmap.now.year - by) <= e.maxAge! ? 2 : 0;
        checks.add(('Age up to ${e.maxAge}', st));
        score += st == 2 ? 5 : st == 0 ? -20 : 0;
      }
      if (e.fields.isNotEmpty) checks.add(('Fields: ${e.fields.join(', ')}', 1));
      if (e.note != null && e.note!.isNotEmpty) checks.add((e.note!, 1));
      score -= ((f.difficulty ?? 3) - 1) * 3;
      scholarships.add(ScholarshipFit(funding: f, fit: score.clamp(3, 97), checks: checks, inPlan: inPlan[f.id] == true));
    }

    return FinanceModel._(roadmap: roadmap, profile: profile, costs: costs, sources: sources, years: years, perYear: per, scholarships: scholarships);
  }

  /// Costs, funds by source and gap per roadmap phase (prototype "How you pay for each phase").
  List<({RoadmapPhase phase, double cost, Map<FundSource, double> by, double gap})> get byPhase {
    final out = <({RoadmapPhase phase, double cost, Map<FundSource, double> by, double gap})>[];
    for (final p in roadmap.phases) {
      final ys = perYear.where((x) => _phaseOfYear(x.year) == p).toList();
      final cost = ys.fold<double>(0, (s, x) => s + x.costs);
      if (cost == 0) continue;
      final by = {for (final s in FundSource.values) s: ys.fold<double>(0, (acc, x) => acc + (x.bySource[s] ?? 0))};
      final f = by.values.fold<double>(0, (a, b) => a + b);
      out.add((phase: p, cost: cost, by: by, gap: math.max(0, cost - f)));
    }
    return out;
  }

  RoadmapPhase _phaseOfYear(int y) {
    var k = roadmap.phases.first;
    for (final p in roadmap.phases) {
      if (y + 0.5 >= p.start) k = p;
    }
    return k;
  }

  /// Savings planner defaults: the first funds requirement on the route (e.g. blocked account) and
  /// the month the first visa step starts.
  ({double target, Provenance? provenance, String label, double dueYear})? get savingsTarget {
    final req = roadmap.content.requirements.where((r) => r.type == RequirementType.funds && roadmap.plan.gaps.any((g) => g.requirementId == r.id)).firstOrNull;
    final visa = roadmap.steps.where((s) => s.kind == PlanStepKind.visa).firstOrNull;
    if (req?.money == null) {
      final permit = roadmap.content.residencePermits.where((p) => p.id == visa?.step?.permitId).firstOrNull;
      if (permit?.fundsProof == null) return null;
      return (target: permit!.fundsProof!.amount, provenance: permit.provenance, label: 'proof of funds', dueYear: visa?.start ?? roadmap.todayYear + 1);
    }
    return (target: req!.money!.amount, provenance: req.provenance, label: req.label.en, dueYear: visa?.start ?? roadmap.todayYear + 1);
  }
}
