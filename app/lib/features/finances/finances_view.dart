// Prototype `finances()`: tabs Overview (tiles, costs vs funds chart, costs by step, your money),
// Finance it (per-phase coverage with ideas, savings planner, all funding options) and
// Scholarships (filterable list from the content). Right panel: funding gap, balance by year.
// Every amount from content carries its provenance; the ideas list is qualitative on purpose.
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/finance_model.dart';
import '../../core/engine/roadmap_model.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/provenance_chip.dart';
import '../../shared/widgets/tabs.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';

enum FinTab { overview, plan, scholarships }

const sourceLabels = {FundSource.savings: 'Savings', FundSource.family: 'Family', FundSource.work: 'Work', FundSource.scholarship: 'Scholarships', FundSource.other: 'Other'};
const _sourceColor = {FundSource.savings: 5, FundSource.family: 1, FundSource.work: 3, FundSource.scholarship: 2, FundSource.other: 4};

/// Prototype OPTS without the illustrative amounts (numbers only with provenance, rule 2).
const fundingIdeas = <(String, IconData, String, String, String, String)>[
  ('Scholarships', Icons.school_outlined, 'High effort', 'Free money, often with mentoring', 'Very competitive; deadlines a year ahead', 'Apply to 5 or more. Reuse one strong essay.'),
  ('Employer sponsorship', Icons.work_outline_rounded, 'Needs a job first', 'Tuition paid and a job after', 'You commit to stay 2–3 years', 'Ask HR in your first year of work.'),
  ('Work while studying', Icons.schedule_rounded, '10–20 h a week', 'Experience plus income', 'Student visas limit working hours; check the permit', 'Look for working-student jobs in your field.'),
  ('Family & diaspora', Icons.people_outline_rounded, 'One honest conversation', 'Flexible, no interest', 'Can create pressure', 'Show your budget and plan. A sponsor letter can count as proof of funds in some countries.'),
  ('Osusu savings group', Icons.account_balance_wallet_outlined, 'Monthly contribution', 'Forces regular saving', 'Your turn may come late', 'Time your payout for a big cost like flights or the visa.'),
  ('Education loan', Icons.euro_rounded, 'Paperwork + guarantor', 'Covers large one-off costs', 'Interest and currency risk', 'Only with a clear repayment plan. Compare interest rates.'),
  ('Low or no tuition', Icons.public_rounded, 'Language needed', 'Public universities in some countries charge mainly semester fees', 'Often taught in the local language', 'Check the tuition figure of each country under Visa & residence.'),
  ('Community & crowdfunding', Icons.auto_awesome_rounded, 'Share your story', 'Good for exam fees or a laptop', 'Small amounts', 'Church, mosque, alumni groups and local businesses.'),
];
const _ideasByPhaseKind = {'prepare': [3, 4, 2, 0], 'move': [0, 3, 4, 5], 'study': [6, 2, 0, 1], 'work': [2, 1], 'goal': [2]};

class FinancesView extends ConsumerStatefulWidget {
  const FinancesView({super.key});

  @override
  ConsumerState<FinancesView> createState() => _FinancesViewState();
}

class _FinancesViewState extends ConsumerState<FinancesView> {
  FinTab _tab = FinTab.overview;

  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(activeGoalProvider);
    if (goal == null) {
      return const ViewScaffold(center: [PageHead(over: 'Your path', title: 'Finances', caption: 'Add a goal first; costs follow from its route.')]);
    }
    final model = ref.watch(financeProvider);
    return model.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(center: [PageHead(over: 'Your path', title: 'Finances', caption: '$e')]),
      data: (m) => m == null ? const Center(child: CircularProgressIndicator()) : _build(context, m),
    );
  }

  Widget _build(BuildContext context, FinanceModel m) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final gap = m.gap;
    final tabs = NjiaTabs<FinTab>(
      tabs: const [(FinTab.overview, 'Overview'), (FinTab.plan, 'Finance it'), (FinTab.scholarships, 'Scholarships')],
      value: _tab,
      onChanged: (v) => setState(() => _tab = v),
    );
    final body = switch (_tab) {
      FinTab.overview => _Overview(model: m),
      FinTab.plan => _FinanceIt(model: m, onScholarships: () => setState(() => _tab = FinTab.scholarships)),
      FinTab.scholarships => _Scholarships(model: m),
    };
    return ViewScaffold(
      center: [
        const PageHead(over: 'Your path', title: 'Finances', caption: 'What your path costs and how you pay for it.'),
        tabs,
        body,
      ],
      right: [
        Section(
          children: [
            Text('Funding gap', style: text.titleMedium),
            Text('Costs minus planned money', style: text.bodySmall),
            Text(gap > 0 ? formatMoney(gap, 'EUR') : 'Covered', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: gap > 0 ? t.warn : t.ok, height: 1.2)),
            ProgressBar(m.coverage / 100, height: 10),
            Text('${m.coverage}% of ${formatMoney(m.totalCost, 'EUR')} covered', style: text.bodySmall),
          ],
        ),
        gap > 0
            ? const NoteBox(warn: false, title: 'Close the gap', body: 'Open Finance it for options per phase, or add scholarships to your plan.')
            : const NoteBox(warn: false, title: 'Fully funded', body: 'Keep a buffer of about 10%.'),
        Section(
          children: [
            Text('Balance by year', style: text.titleMedium),
            for (final p in m.perYear.where((p) => p.costs > 0 || p.funds > 0)) KeyValueRow('${p.year}', formatMoney(p.cumulative, 'EUR'), valueColor: p.cumulative < 0 ? t.bad : null),
          ],
        ),
      ],
    );
  }
}

// ------------------------------------------------------------------ Overview
class _Overview extends ConsumerStatefulWidget {
  const _Overview({required this.model});
  final FinanceModel model;
  @override
  ConsumerState<_Overview> createState() => _OverviewState();
}

class _OverviewState extends ConsumerState<_Overview> {
  final _name = TextEditingController();
  final _amt = TextEditingController();
  late final _from = TextEditingController(text: '${widget.model.years.first + 1}');
  late final _to = TextEditingController(text: '${widget.model.years.first + 2}');

  @override
  void dispose() {
    for (final c in [_name, _amt, _from, _to]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _addSource() async {
    final amt = int.tryParse(_amt.text.trim());
    final goalId = widget.model.roadmap.goal.id;
    if (amt == null || amt <= 0 || goalId == null) return;
    final from = int.tryParse(_from.text.trim()) ?? widget.model.years.first;
    final to = int.tryParse(_to.text.trim()) ?? from;
    final list = [...(widget.model.roadmap.progress['money'] as List? ?? const [])];
    list.add({'name': _name.text.trim().isEmpty ? 'New source' : _name.text.trim(), 'source': 'other', 'from': math.min(from, to), 'to': math.max(from, to), 'perYear': amt});
    await _saveMoney(list);
    _name.clear();
    _amt.clear();
    if (mounted) toast(context, 'Money source added');
  }

  Future<void> _saveMoney(List<dynamic> list) async {
    final uid = ref.read(currentUidProvider);
    final goalId = widget.model.roadmap.goal.id;
    if (uid == null || goalId == null) return;
    final profile = ref.read(profileProvider).value;
    final all = Map<String, dynamic>.from(profile?.progress ?? const {});
    final g = Map<String, dynamic>.from(all[goalId] as Map? ?? const {});
    g['money'] = list;
    all[goalId] = g;
    await ref.read(userRepositoryProvider).updateProfile(uid, {'progress': all});
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final sources = ref.watch(sourceNamesProvider).value ?? const <String, String>{};
    final biggest = m.biggest;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, c) {
            final cols = c.maxWidth >= 760 ? 4 : 2;
            final w = (c.maxWidth - 16 * (cols - 1)) / cols;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(width: w, child: StatTile(label: 'Total cost', value: formatMoney(m.totalCost, 'EUR'), caption: '${m.years.first}–${m.years.last}')),
                SizedBox(width: w, child: StatTile(label: 'Funds planned', value: formatMoney(m.totalFunds, 'EUR'), caption: '${m.coverage}% covered')),
                SizedBox(width: w, child: StatTile(label: 'Funding gap', value: m.gap > 0 ? formatMoney(m.gap, 'EUR') : 'none', caption: m.gap > 0 ? 'see Finance it' : 'fully covered', valueColor: m.gap > 0 ? t.warn : null)),
                SizedBox(
                  width: w,
                  child: StatTile(
                    label: 'Biggest item',
                    value: biggest == null ? '—' : formatMoney(biggest.total, biggest.currency),
                    caption: biggest?.label,
                    chip: biggest?.provenance == null ? null : ProvenanceChip(biggest!.provenance!, sourceName: sources[biggest.provenance!.sourceId]),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        NjiaCard(
          children: [
            Text('Costs vs. funds per year', style: text.titleMedium),
            Wrap(spacing: 14, children: [_legend(context, 'Costs', t.accent), _legend(context, 'Funds', t.brand)]),
            _YearChart(model: m),
          ],
        ),
        const SizedBox(height: 20),
        NjiaCard(
          gap: 6,
          children: [
            Text('Costs by step', style: text.titleMedium),
            Text('Linked to your roadmap', style: text.bodySmall),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 560),
                child: Table(
                  columnWidths: const {0: FlexColumnWidth(2.2), 1: FlexColumnWidth(0.9), 2: FlexColumnWidth(0.9), 3: FlexColumnWidth(0.9)},
                  children: [
                    TableRow(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))),
                      children: [for (final h in ['Item', 'Years', 'Per year', 'Total']) Padding(padding: const EdgeInsets.fromLTRB(10, 8, 10, 8), child: Text(h, textAlign: h == 'Item' || h == 'Years' ? TextAlign.left : TextAlign.right, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted)))],
                    ),
                    for (final c in m.costs)
                      TableRow(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(c.label, style: const TextStyle(fontWeight: FontWeight.w600)),
                                if (c.provenance != null) Padding(padding: const EdgeInsets.only(top: 4), child: ProvenanceChip(c.provenance!, sourceName: sources[c.provenance!.sourceId])),
                              ],
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(10), child: Text(c.from == c.to ? '${c.from}' : '${c.from}–${c.to}', style: text.bodySmall)),
                          Padding(padding: const EdgeInsets.all(10), child: Text(formatMoney(c.perYear, c.currency), textAlign: TextAlign.right, style: text.bodySmall)),
                          Padding(padding: const EdgeInsets.all(10), child: Text(formatMoney(c.total, c.currency), textAlign: TextAlign.right, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
                        ],
                      ),
                    TableRow(children: [
                      const Padding(padding: EdgeInsets.all(10), child: Text('Total', style: TextStyle(fontWeight: FontWeight.w600))),
                      const SizedBox(),
                      const SizedBox(),
                      Padding(padding: const EdgeInsets.all(10), child: Text(formatMoney(m.totalCost, 'EUR'), textAlign: TextAlign.right, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
                    ]),
                  ],
                ),
              ),
            ),
            if (m.costs.any((c) => c.currency != 'EUR')) Text('Totals add up EUR items only.', style: text.bodySmall),
          ],
        ),
        const SizedBox(height: 20),
        NjiaCard(
          gap: 2,
          children: [
            Text('Your money', style: text.titleMedium),
            Text('What you have or expect', style: text.bodySmall),
            for (final s in m.sources)
              ListRow(
                icon: s.source == FundSource.scholarship ? Icons.school_outlined : Icons.account_balance_wallet_outlined,
                title: s.name,
                subtitle: s.source == FundSource.scholarship ? 'Scholarship in your plan' : '${s.from == s.to ? s.from : '${s.from}–${s.to}'} · ${formatMoney(s.perYear, 'EUR')}${s.from == s.to ? '' : ' / yr'}',
                trailing: [
                  Text(formatMoney(s.total, 'EUR'), style: const TextStyle(fontWeight: FontWeight.w700, fontFeatures: [FontFeature.tabularFigures()])),
                  if (s.userIndex != null)
                    IconButton(
                      tooltip: 'Remove',
                      icon: const Icon(Icons.close_rounded, size: 14),
                      onPressed: () => _saveMoney([...(m.roadmap.progress['money'] as List? ?? const [])]..removeAt(s.userIndex!)),
                    ),
                ],
              ),
            if (m.sources.isEmpty) Text('Add your savings and monthly support in your profile, or a source below.', style: text.bodySmall),
            const SizedBox(height: 10),
            FormGrid(children: [
              Field(label: 'Source', child: TextField(controller: _name, decoration: const InputDecoration(hintText: 'e.g. Uncle in London'))),
              Field(label: '€ per year', child: TextField(controller: _amt, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], decoration: const InputDecoration(hintText: '1000'))),
              Field(label: 'From', child: TextField(controller: _from, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
              Field(label: 'To', child: TextField(controller: _to, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
            ]),
            const SizedBox(height: 12),
            FilledButton.icon(onPressed: _addSource, icon: const Icon(Icons.add_rounded, size: 14), label: const Text('Add money source')),
          ],
        ),
      ],
    );
  }
}

Widget _legend(BuildContext context, String label, Color color) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [Container(width: 14, height: 10, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))), const SizedBox(width: 6), Text(label, style: Theme.of(context).textTheme.bodySmall)],
    );

/// Prototype `finChart`: two bars per year (costs, funds), gridlines in k.
class _YearChart extends StatelessWidget {
  const _YearChart({required this.model});
  final FinanceModel model;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final per = model.perYear;
    final top = (math.max(5000, per.fold<double>(0, (m, p) => math.max(m, math.max(p.costs, p.funds)))) / 5000).ceil() * 5000;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: math.max(520, per.length * 56 + 46),
        height: 230,
        child: CustomPaint(painter: _ChartPainter(per: per, top: top.toDouble(), costColor: t.accent, fundColor: t.brand, line: t.line, muted: t.muted)),
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  _ChartPainter({required this.per, required this.top, required this.costColor, required this.fundColor, required this.line, required this.muted});
  final List<YearlyFunds> per;
  final double top;
  final Color costColor, fundColor, line, muted;

  @override
  void paint(Canvas canvas, Size size) {
    const l = 46.0, b = 26.0, tp = 10.0;
    final h = size.height;
    double ys(double v) => tp + (h - tp - b) * (1 - v / top);
    final bw = (size.width - l - 8) / per.length;
    final gridPaint = Paint()
      ..color = line
      ..strokeWidth = 1;
    for (var v = 0.0; v <= top; v += top / 5) {
      canvas.drawLine(Offset(l, ys(v)), Offset(size.width - 8, ys(v)), gridPaint);
      _text(canvas, '${(v / 1000).round()}k', Offset(l - 6, ys(v) - 6), align: TextAlign.right, color: muted);
    }
    for (final (i, p) in per.indexed) {
      final x = l + i * bw + bw * .15, w = bw * .33;
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTRB(x, ys(p.costs), x + w, ys(0)), const Radius.circular(3)), Paint()..color = costColor);
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTRB(x + w + 2, ys(p.funds), x + 2 * w + 2, ys(0)), const Radius.circular(3)), Paint()..color = fundColor);
      _text(canvas, "'${'${p.year}'.substring(2)}", Offset(l + i * bw + bw / 2, h - 16), align: TextAlign.center, color: muted);
    }
  }

  void _text(Canvas canvas, String s, Offset at, {required TextAlign align, required Color color}) {
    final tp = TextPainter(text: TextSpan(text: s, style: TextStyle(fontSize: 11, color: color, fontFamily: NjiaTokens.fontFamily)), textDirection: TextDirection.ltr)..layout();
    final dx = align == TextAlign.right ? at.dx - tp.width : align == TextAlign.center ? at.dx - tp.width / 2 : at.dx;
    tp.paint(canvas, Offset(dx, at.dy));
  }

  @override
  bool shouldRepaint(_ChartPainter old) => old.per != per || old.top != top;
}

// ------------------------------------------------------------------ Finance it
class _FinanceIt extends ConsumerStatefulWidget {
  const _FinanceIt({required this.model, required this.onScholarships});
  final FinanceModel model;
  final VoidCallback onScholarships;
  @override
  ConsumerState<_FinanceIt> createState() => _FinanceItState();
}

class _FinanceItState extends ConsumerState<_FinanceIt> {
  int? _open;
  double? _target;
  double? _saved;
  double? _monthly;

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final sources = ref.watch(sourceNamesProvider).value ?? const <String, String>{};
    final planner = Map<String, dynamic>.from(m.roadmap.progress['savingsPlan'] as Map? ?? const {});
    final st = m.savingsTarget;
    final target = _target ?? (planner['target'] as num?)?.toDouble() ?? st?.target ?? 5000;
    final saved = _saved ?? m.profile.savings?.amount ?? 0;
    final monthly = _monthly ?? (planner['monthly'] as num?)?.toDouble() ?? m.profile.monthlySupport?.amount ?? 0;
    final dueYear = st?.dueYear ?? m.roadmap.todayYear + 1;
    final months = math.max(1, ((dueYear - m.roadmap.todayYear) * 12).round());
    final proj = saved + monthly * months;
    final need = math.max(0, ((target - saved) / months).ceil());
    final ok = proj >= target;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NjiaCard(
          children: [
            Text('How you pay for each phase', style: text.titleMedium),
            Text('Your money by source, and the gap. Open a phase for ideas.', style: text.bodySmall),
            Wrap(spacing: 14, runSpacing: 6, children: [
              for (final s in FundSource.values) _legend(context, sourceLabels[s]!, t.phases[_sourceColor[s]!]),
              Row(mainAxisSize: MainAxisSize.min, children: [Container(width: 14, height: 10, decoration: BoxDecoration(color: t.badSoft, border: Border.all(color: t.bad), borderRadius: BorderRadius.circular(3))), const SizedBox(width: 6), Text('Gap', style: text.bodySmall)]),
            ]),
            for (final row in m.byPhase)
              AccordionItem(
                title: row.phase.name,
                subtitle: '${row.phase.start.floor()}–${row.phase.end.floor()} · costs ${formatMoney(row.cost, 'EUR')} · ${row.gap > 0 ? 'gap ${formatMoney(row.gap, 'EUR')}' : 'covered'}',
                open: _open == row.phase.index,
                onToggle: () => setState(() => _open = _open == row.phase.index ? null : row.phase.index),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Stack(row: row),
                    const SizedBox(height: 10),
                    Wrap(spacing: 14, runSpacing: 6, children: [
                      for (final e in row.by.entries) if (e.value > 0) _legend(context, '${sourceLabels[e.key]} ${formatMoney(e.value, 'EUR')}', t.phases[_sourceColor[e.key]!]),
                      if (row.gap > 0) Text('Gap ${formatMoney(row.gap, 'EUR')}', style: TextStyle(fontSize: 12, color: t.bad)),
                    ]),
                    const SizedBox(height: 14),
                    const OverLabel('Ideas for this phase'),
                    const SizedBox(height: 8),
                    _IdeaGrid(indices: _ideasByPhaseKind[row.phase.isMove ? 'move' : row.phase.isGoal ? 'goal' : row.phase.index == 1 ? 'prepare' : row.phase.steps.any((s) => s.kind == PlanStepKind.study) ? 'study' : 'work'] ?? const [0], compact: true),
                    if (row.phase.isMove && st != null) ...[
                      const SizedBox(height: 12),
                      NoteBox(warn: true, title: 'Proof of money comes first', body: '${st.label}: ${formatMoney(st.target, 'EUR')} must be available before the visa appointment. Start saving by ${formatYear(st.dueYear - 2)}.'),
                      if (st.provenance != null) Padding(padding: const EdgeInsets.only(top: 6), child: ProvenanceChip(st.provenance!, sourceName: sources[st.provenance!.sourceId])),
                    ],
                    const SizedBox(height: 12),
                    Align(alignment: Alignment.centerLeft, child: OutlinedButton.icon(onPressed: widget.onScholarships, icon: const Icon(Icons.school_outlined, size: 14), label: const Text('Find scholarships for this phase'))),
                  ],
                ),
              ),
            if (m.byPhase.isEmpty) Text('No costs on this route yet.', style: text.bodySmall),
          ],
        ),
        const SizedBox(height: 20),
        NjiaCard(
          children: [
            Text('Savings planner', style: text.titleMedium),
            Text('For ${st?.label ?? 'your starting money'} by ${formatYear(dueYear)}', style: text.bodySmall),
            if (st?.provenance != null) ProvenanceChip(st!.provenance!, sourceName: sources[st.provenance!.sourceId]),
            FormGrid(children: [
              Field(label: 'Target (€)', child: TextFormField(initialValue: target.round().toString(), keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (v) => setState(() => _target = double.tryParse(v) ?? target))),
              Field(label: 'Already saved (€)', child: TextFormField(initialValue: saved.round().toString(), keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (v) => setState(() => _saved = double.tryParse(v) ?? saved))),
            ]),
            Row(children: [Expanded(child: Text('You save per month', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted))), Text(formatMoney(monthly, 'EUR'), style: const TextStyle(fontWeight: FontWeight.w700))]),
            Slider(value: monthly.clamp(0, 600), min: 0, max: 600, divisions: 60, onChanged: (v) => setState(() => _monthly = v), onChangeEnd: (v) => _savePlanner(target, v)),
            Row(children: [
              Expanded(child: StatTile(label: "In $months months you'll have", value: formatMoney(proj, 'EUR'), valueColor: ok ? t.ok : t.warn)),
              const SizedBox(width: 12),
              Expanded(child: StatTile(label: 'Needed per month', value: formatMoney(need, 'EUR'))),
            ]),
            ok
                ? const NoteBox(warn: false, title: 'On track', body: 'You reach the target in time. Keep a small buffer.')
                : NoteBox(warn: true, title: 'Not enough yet', body: 'Raise the monthly amount to ${formatMoney(need, 'EUR')}, add a family contribution, or time an osusu payout for ${formatYear(dueYear - 0.5)}.'),
          ],
        ),
        const SizedBox(height: 20),
        NjiaCard(
          children: [
            Text('All funding options', style: text.titleMedium),
            Text('General ideas, not financial advice', style: text.bodySmall),
            _IdeaGrid(indices: List.generate(fundingIdeas.length, (i) => i), compact: false),
          ],
        ),
      ],
    );
  }

  Future<void> _savePlanner(double target, double monthly) async {
    final goalId = widget.model.roadmap.goal.id;
    if (goalId == null) return;
    await saveProgress(ref, goalId: goalId, section: 'savingsPlan', key: 'target', value: target);
    await saveProgress(ref, goalId: goalId, section: 'savingsPlan', key: 'monthly', value: monthly);
  }
}

class _Stack extends StatelessWidget {
  const _Stack({required this.row});
  final ({RoadmapPhase phase, double cost, Map<FundSource, double> by, double gap}) row;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final tot = math.max(row.cost, row.by.values.fold<double>(0, (a, b) => a + b));
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 12,
        color: t.subtle,
        child: Row(
          children: [
            for (final e in row.by.entries) if (e.value > 0) Expanded(flex: (e.value / tot * 1000).round(), child: Container(color: t.phases[_sourceColor[e.key]!])),
            if (row.gap > 0) Expanded(flex: (row.gap / tot * 1000).round(), child: Container(color: t.badSoft)),
          ],
        ),
      ),
    );
  }
}

class _IdeaGrid extends StatelessWidget {
  const _IdeaGrid({required this.indices, required this.compact});
  final List<int> indices;
  final bool compact;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, c) {
        final cols = math.max(1, (c.maxWidth / 232).floor());
        final w = (c.maxWidth - 12 * (cols - 1)) / cols;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final i in indices)
              SizedBox(
                width: w,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(border: Border.all(color: t.line), borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [IconBox(fundingIdeas[i].$2), const SizedBox(width: 8), Expanded(child: Text(fundingIdeas[i].$1, style: const TextStyle(fontWeight: FontWeight.w700)))]),
                      if (!compact) ...[
                        const SizedBox(height: 4),
                        Text(fundingIdeas[i].$3, style: text.bodySmall),
                        const SizedBox(height: 6),
                        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.check_circle_outline_rounded, size: 14, color: t.ok), const SizedBox(width: 6), Expanded(child: Text(fundingIdeas[i].$4, style: const TextStyle(fontSize: 12)))]),
                        const SizedBox(height: 4),
                        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.error_outline_rounded, size: 14, color: t.warn), const SizedBox(width: 6), Expanded(child: Text(fundingIdeas[i].$5, style: const TextStyle(fontSize: 12)))]),
                      ],
                      const SizedBox(height: 6),
                      Text(fundingIdeas[i].$6, style: text.bodySmall),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

// ------------------------------------------------------------------ Scholarships
enum _Sort { fit, grant, difficulty, deadline }

class _Scholarships extends ConsumerStatefulWidget {
  const _Scholarships({required this.model});
  final FinanceModel model;
  @override
  ConsumerState<_Scholarships> createState() => _ScholarshipsState();
}

class _ScholarshipsState extends ConsumerState<_Scholarships> {
  String _q = '';
  FundingType? _type;
  int _maxDiff = 5;
  _Sort _sort = _Sort.fit;
  String? _open;

  static const _diffLabel = ['', 'Easy', 'Moderate', 'Competitive', 'Hard', 'Very hard'];

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final sources = ref.watch(sourceNamesProvider).value ?? const <String, String>{};
    final q = _q.toLowerCase();
    var list = m.scholarships.where((s) {
      final f = s.funding;
      return (_type == null || f.type == _type) && (f.difficulty ?? 3) <= _maxDiff && (q.isEmpty || '${f.name} ${f.funder} ${f.howToApply?.en ?? ''}'.toLowerCase().contains(q));
    }).toList();
    double amountOf(Funding f) => f.amount == null ? 0 : (f.amount!.period == MoneyPeriod.month ? f.amount!.max * 12 : f.amount!.max);
    list.sort((a, b) => switch (_sort) {
          _Sort.fit => b.fit.compareTo(a.fit),
          _Sort.grant => amountOf(b.funding).compareTo(amountOf(a.funding)),
          _Sort.difficulty => (a.funding.difficulty ?? 3).compareTo(b.funding.difficulty ?? 3),
          _Sort.deadline => (a.funding.applicationWindow?.closes ?? '9999').compareTo(b.funding.applicationWindow?.closes ?? '9999'),
        });
    final inPlanCount = m.scholarships.where((s) => s.inPlan).length;
    final types = m.scholarships.map((s) => s.funding.type).toSet().toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NjiaCard(
          gap: 12,
          children: [
            FormGrid(children: [
              Field(label: 'Search', child: TextField(decoration: const InputDecoration(hintText: 'Name, funder, topic'), onChanged: (v) => setState(() => _q = v))),
              SelectField<FundingType?>(label: 'Type', value: _type, items: [(null, 'All'), for (final ty in types) (ty, ty.value.replaceAll('_', ' '))], onChanged: (v) => setState(() => _type = v)),
              SelectField<int>(label: 'Max difficulty', value: _maxDiff, items: const [(5, 'Any'), (4, 'Up to hard'), (3, 'Up to competitive'), (2, 'Up to moderate'), (1, 'Easy only')], onChanged: (v) => setState(() => _maxDiff = v ?? 5)),
              SelectField<_Sort>(label: 'Sort', value: _sort, items: const [(_Sort.fit, 'Best fit'), (_Sort.grant, 'Biggest grant'), (_Sort.difficulty, 'Easiest first'), (_Sort.deadline, 'Next deadline')], onChanged: (v) => setState(() => _sort = v ?? _Sort.fit)),
            ]),
            Text('${list.length} funding options · $inPlanCount in your plan', style: text.bodySmall),
          ],
        ),
        const SizedBox(height: 10),
        for (final s in list) ...[
          _ScholarshipItem(
            fit: s,
            open: _open == s.funding.id,
            onToggle: () => setState(() => _open = _open == s.funding.id ? null : s.funding.id),
            sources: sources,
            diffLabel: _diffLabel,
            onPlan: () {
              final goalId = m.roadmap.goal.id;
              if (goalId != null) saveProgress(ref, goalId: goalId, section: 'funding', key: s.funding.id, value: s.inPlan ? null : true);
            },
          ),
          const SizedBox(height: 10),
        ],
        if (list.isEmpty)
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(border: Border.all(color: t.lineStrong, width: 1.5, style: BorderStyle.solid), borderRadius: BorderRadius.circular(NjiaTokens.radius)),
            child: Column(children: [const Text('No funding matches', style: TextStyle(fontWeight: FontWeight.w700)), Text('Loosen a filter.', style: text.bodySmall)]),
          ),
        Text('From the content database for this corridor. Amounts and windows show their source; estimates are marked.', style: text.bodySmall),
      ],
    );
  }
}

class _ScholarshipItem extends StatelessWidget {
  const _ScholarshipItem({required this.fit, required this.open, required this.onToggle, required this.sources, required this.diffLabel, required this.onPlan});
  final ScholarshipFit fit;
  final bool open;
  final VoidCallback onToggle;
  final Map<String, String> sources;
  final List<String> diffLabel;
  final VoidCallback onPlan;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final f = fit.funding;
    final a = f.amount;
    final amount = a == null ? 'Amount not listed' : '${formatMoney(a.min, a.currency)}${a.max != a.min ? ' – ${formatMoney(a.max, a.currency)}' : ''}${a.period == null ? '' : ' / ${a.period!.value}'}';
    final diff = (f.difficulty ?? 3).clamp(1, 5);
    final w = f.applicationWindow;
    final deadline = w?.closes == null ? (w?.note ?? 'see page') : formatDate(w!.closes);
    return Container(
      decoration: BoxDecoration(color: t.surface, borderRadius: BorderRadius.circular(NjiaTokens.radius), border: Border.all(color: open ? t.brand : t.line, width: open ? 2 : 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(NjiaTokens.radius),
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 40, height: 40, decoration: BoxDecoration(color: t.phasesSoft[2], borderRadius: BorderRadius.circular(8)), child: Icon(Icons.school_outlined, size: 18, color: t.phases[2])),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(child: Text(f.name, style: const TextStyle(fontWeight: FontWeight.w700))),
                          const SizedBox(width: 8),
                          NjiaBadge('${fit.fit}% fit', tone: fit.fit >= 70 ? BadgeTone.ok : fit.fit >= 45 ? BadgeTone.brand : BadgeTone.neutral),
                        ]),
                        Text('${f.funder} · ${f.countryIds.join(', ')} · ${f.type.value.replaceAll('_', ' ')}', style: text.bodySmall),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 10,
                          runSpacing: 4,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(amount, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              for (var i = 1; i <= 5; i++) Container(width: 7, height: 7, margin: const EdgeInsets.only(right: 3), decoration: BoxDecoration(color: i <= diff ? t.accent : t.lineStrong, shape: BoxShape.circle)),
                              const SizedBox(width: 3),
                              Text(diffLabel[diff], style: text.bodySmall),
                            ]),
                            Text('Deadline $deadline', style: text.bodySmall),
                            if (fit.inPlan) const NjiaBadge('In plan', tone: BadgeTone.brand),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(open ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: t.muted),
                ],
              ),
            ),
          ),
          if (open)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: t.line, height: 1),
                  const SizedBox(height: 14),
                  if (f.howToApply?.en != null) Text(f.howToApply!.en),
                  const SizedBox(height: 14),
                  LayoutBuilder(
                    builder: (context, c) {
                      final cols = c.maxWidth >= 640 ? 3 : 1;
                      final cw = (c.maxWidth - 20 * (cols - 1)) / cols;
                      return Wrap(
                        spacing: 20,
                        runSpacing: 16,
                        children: [
                          SizedBox(
                            width: cw,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const OverLabel('Who can apply'),
                              const SizedBox(height: 6),
                              for (final (label, st) in fit.checks) Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [StatusMark(st), const SizedBox(width: 10), Expanded(child: Text(label, style: const TextStyle(fontSize: 12)))])),
                              Text('Difficulty ${diffLabel[diff].toLowerCase()}', style: text.bodySmall),
                            ]),
                          ),
                          SizedBox(
                            width: cw,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const OverLabel('Requirements'),
                              const SizedBox(height: 6),
                              Wrap(spacing: 6, runSpacing: 6, children: [for (final r in f.requirementIds) NjiaBadge(r.replaceAll('-', ' '))]),
                              if (f.covers.isNotEmpty) ...[
                                const SizedBox(height: 12),
                                const OverLabel('Covers'),
                                const SizedBox(height: 6),
                                Wrap(spacing: 6, runSpacing: 6, children: [for (final c in f.covers) NjiaBadge(c.value.replaceAll('_', ' '), tone: BadgeTone.ok)]),
                              ],
                            ]),
                          ),
                          SizedBox(
                            width: cw,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const OverLabel('Deadlines'),
                              const SizedBox(height: 6),
                              if (w?.opens != null) KeyValueRow('Opens', formatDate(w!.opens)),
                              if (w?.closes != null) KeyValueRow('Deadline', formatDate(w!.closes)),
                              if (w?.note != null) Text(w!.note!, style: text.bodySmall),
                              const SizedBox(height: 12),
                              const OverLabel('Grant'),
                              Text(amount, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: t.brand)),
                              const SizedBox(height: 4),
                              ProvenanceChip(f.provenance, sourceName: sources[f.provenance.sourceId]),
                            ]),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    fit.inPlan
                        ? OutlinedButton(onPressed: onPlan, child: const Text('Remove from plan'))
                        : FilledButton(onPressed: onPlan, child: const Text('Add to my funding plan')),
                    OutlinedButton.icon(onPressed: () => context.go(Routes.coach), icon: const Icon(Icons.menu_book_outlined, size: 14), label: const Text('Prepare essay with coach')),
                  ]),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
