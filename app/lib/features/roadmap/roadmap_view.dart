// Prototype `roadmap()` + `stepDetail()`: full-width Gantt (phase rows × years, step bars, today
// marker), inline step detail (Where · Target · To do · Done when · Unlocks) with a ProvenanceChip
// on every content number, then "Decision points" and "Watch out" below. No right panel.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../core/engine/roadmap_model.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/gantt.dart';
import '../../shared/widgets/provenance_chip.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import '../assistant/assistant.dart';
import '../goal/goal_title.dart';

class RoadmapView extends ConsumerStatefulWidget {
  const RoadmapView({super.key, this.openStepKey});
  final String? openStepKey;

  @override
  ConsumerState<RoadmapView> createState() => _RoadmapViewState();
}

class _RoadmapViewState extends ConsumerState<RoadmapView> {
  String? _open;
  bool _seen = false;

  @override
  void initState() {
    super.initState();
    _open = widget.openStepKey;
  }

  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(activeGoalProvider);
    if (goal == null) {
      return const ViewScaffold(
        center: [
          PageHead(over: 'Your path', title: 'Roadmap', caption: 'Add a goal first; the roadmap follows from it.'),
        ],
      );
    }
    final roadmap = ref.watch(roadmapProvider);
    final rm = roadmap.value;
    // Getting started step 4 ("Walk through your roadmap") is done once the roadmap was opened.
    if (!_seen && rm != null && rm.goal.id != null && (rm.progress['guide'] as Map?)?['roadmap'] != true) {
      _seen = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => saveProgress(ref, goalId: rm.goal.id!, section: 'guide', key: 'roadmap', value: true));
    }
    return roadmap.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(
        center: [PageHead(over: 'Your path', title: 'Roadmap', caption: '$e')],
      ),
      data: (m) => m == null
          ? const ViewScaffold(
              center: [
                PageHead(
                  over: 'Your path',
                  title: 'Computing your roadmap…',
                  caption: 'This takes a moment after a goal is saved.',
                ),
              ],
            )
          : _build(context, m),
    );
  }

  Widget _build(BuildContext context, RoadmapModel m) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final sources = ref.watch(sourceNamesProvider).value ?? const <String, String>{};
    return ViewScaffold(
      center: [
        PageHead(
          over: 'Your path',
          title: 'Roadmap',
          caption: '${goalTitle(m.goal)} · ${m.now.year} → ${m.goal.targetYear ?? ''}',
        ),
        NjiaCard(
          gap: 8,
          children: [
            Row(
              children: [
                Expanded(child: Text('Tap a step to open it', style: text.bodySmall)),
                Wrap(
                  spacing: 14,
                  children: [
                    _legend(context, 'In progress', fill: t.phases[0]),
                    _legend(context, 'Planned', fill: t.phasesSoft[1], border: t.phases[1]),
                    _legend(context, 'Done', fill: t.subtle, border: t.lineStrong),
                  ],
                ),
              ],
            ),
            LayoutBuilder(
              builder: (context, c) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 720, maxWidth: c.maxWidth < 720 ? 720 : c.maxWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  'Step',
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted),
                                ),
                              ),
                            ),
                            Expanded(child: YearAxis(model: m)),
                          ],
                        ),
                      ),
                      for (final p in m.phases) ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 14, 0, 6),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(color: phaseColor(context, p.index), shape: BoxShape.circle),
                              ),
                              const SizedBox(width: 8),
                              Text(p.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                              const SizedBox(width: 8),
                              Text('${p.start.floor()}–${p.end.floor()}', style: text.bodySmall),
                            ],
                          ),
                        ),
                        for (final s in p.steps) ...[
                          _StepRow(
                            model: m,
                            step: s,
                            open: _open == s.key,
                            onTap: () => setState(() => _open = _open == s.key ? null : s.key),
                          ),
                          if (_open == s.key)
                            _StepDetail(
                              model: m,
                              step: s,
                              sources: sources,
                              onClose: () => setState(() => _open = null),
                              onOpen: (k) => setState(() => _open = k),
                            ),
                        ],
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        LayoutBuilder(
          builder: (context, c) {
            final decisions = NjiaCard(
              children: [
                Text('Decision points', style: text.titleMedium),
                Text('Choices that change your path', style: text.bodySmall),
                if (m.decisions.isEmpty)
                  Text('No alternatives in the content for this route yet.', style: text.bodySmall),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final d in m.decisions)
                      SizedBox(
                        width: c.maxWidth >= 900 ? (c.maxWidth * 1.4 / 2.4 - 40 - 12) / 2 : c.maxWidth - 40,
                        child: _Decision(model: m, decision: d),
                      ),
                  ],
                ),
              ],
            );
            final watch = NjiaCard(
              children: [
                Text('Watch out', style: text.titleMedium),
                if (m.plan.watch.isEmpty) Text('Nothing flagged for this route.', style: text.bodySmall),
                for (final w in m.plan.watch) _Note(warn: w.kind != 'deadline', title: _watchTitle(w), body: w.text),
              ],
            );
            if (c.maxWidth >= 900) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 14, child: decisions),
                  const SizedBox(width: 16),
                  Expanded(flex: 10, child: watch),
                ],
              );
            }
            return Column(children: [decisions, const SizedBox(height: 16), watch]);
          },
        ),
      ],
    );
  }

  static String _watchTitle(WatchItem w) => switch (w.kind) {
    'visa' => 'Visa appointment abroad',
    'language' => 'Local language',
    'deadline' => 'Deadline soon',
    _ => 'Note',
  };

  Widget _legend(BuildContext context, String label, {required Color fill, Color? border}) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 14,
        height: 10,
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(3),
          border: border == null ? null : Border.all(color: border),
        ),
      ),
      const SizedBox(width: 6),
      Text(label, style: Theme.of(context).textTheme.bodySmall),
    ],
  );
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.model, required this.step, required this.open, required this.onTap});
  final RoadmapModel model;
  final RoadmapStep step;
  final bool open;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final m = model;
    final s = step;
    final color = phaseColor(context, s.phaseIndex);
    final soft = phaseSoft(context, s.phaseIndex);
    final status = m.statusOf(s);
    final (Color bg, Color fg, Color? border) = switch (status) {
      2 => (t.subtle, t.muted, t.lineStrong),
      1 => (color, Colors.white, null),
      _ => (soft, color, color),
    };
    return Material(
      color: open ? t.brandSoft : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Semantics(
          button: true,
          expanded: open,
          child: SizedBox(
            height: 42,
            child: Row(
              children: [
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.expand_more_rounded, size: 14, color: t.muted),
                        const SizedBox(width: 8),
                        Container(
                          width: 22,
                          height: 22,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: soft, shape: BoxShape.circle),
                          child: Text(
                            '${s.number}',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                s.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                s.subtitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, color: t.muted),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Track(
                    model: m,
                    height: 42,
                    showToday: s == m.steps.first,
                    todayLabel: s == m.steps.first,
                    bars: [
                      (w) {
                        final left = m.px(s.start) * w;
                        final width = ((m.px(s.end) - m.px(s.start)) * w).clamp(8.0, w);
                        return Positioned(
                          left: left,
                          width: width,
                          top: 9,
                          height: 24,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: bg,
                              borderRadius: BorderRadius.circular(6),
                              border: border == null ? null : Border.all(color: border),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                if (status == 1) ...[
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(color: t.accent, shape: BoxShape.circle),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                                if (width > 60)
                                  Flexible(
                                    child: Text(
                                      s.barLabel,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: false,
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Inline step detail (`.g-det`). Everything shown comes from the plan step and the content docs
/// it references; each content number carries its provenance.
class _StepDetail extends ConsumerWidget {
  const _StepDetail({
    required this.model,
    required this.step,
    required this.sources,
    required this.onClose,
    required this.onOpen,
  });
  final RoadmapModel model;
  final RoadmapStep step;
  final Map<String, String> sources;
  final VoidCallback onClose;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final m = model;
    final s = step;
    final ps = s.step;
    final c = m.content;
    final phase = m.phases[s.phaseIndex - 1];
    final req = ps?.requirementId == null ? null : c.requirements.where((r) => r.id == ps!.requirementId).firstOrNull;
    final pw = ps?.pathwayId == null ? null : c.pathways.where((p) => p.id == ps!.pathwayId).firstOrNull;
    final permit = ps?.permitId == null ? null : c.residencePermits.where((p) => p.id == ps!.permitId).firstOrNull;
    final country = c.countries.where((x) => x.id == m.goal.countryId).firstOrNull;
    final corridor = c.corridors.firstOrNull;
    final goalId = m.goal.id!;
    String src(Provenance p) => sources[p.sourceId] ?? p.sourceId;

    // ---- Where
    final where = <(String, String, Provenance?)>[];
    if (pw != null) {
      where.add((
        pw.institution ?? pw.title,
        [pw.city, country?.name.en].where((x) => x != null && x.isNotEmpty).join(' · '),
        pw.provenance,
      ));
      for (final alt
          in c.pathways
              .where((p) => p.id != pw.id && p.type == pw.type && p.status != PathwayStatus.withdrawn)
              .take(2)) {
        where.add((
          alt.institution ?? alt.title,
          '${alt.title}${alt.city == null ? '' : ' · ${alt.city}'}',
          alt.provenance,
        ));
      }
    }
    if (permit != null && ps?.applyAt != null) {
      where.add((
        ps!.applyAt!.authority ?? '${ps.applyAt!.city} (${ps.applyAt!.country})',
        'Applications from Sierra Leone are lodged in ${ps.applyAt!.city}',
        corridor?.provenance,
      ));
    }
    if (req != null && req.providerTypes.isNotEmpty) {
      for (final p in req.providerTypes.take(3)) {
        where.add((_providerLabel(p), 'Can help you meet this requirement', null));
      }
    }
    if (where.isEmpty && s.kind == 'goal') {
      where.add((m.goal.employer ?? 'Employer of your choice', m.goal.city ?? '', null));
    }
    final whereChosen = (m.whereChosen[s.key] as num?)?.toInt() ?? 0;

    // ---- Target
    String big = '', bigCap = '', bigBody = '';
    Provenance? bigProv;
    if (req != null) {
      big = _requirementTarget(req);
      bigCap = req.type.value.replaceAll('_', ' ');
      bigBody = req.howToMeet?.en ?? '';
      bigProv = req.provenance;
    } else if (permit != null) {
      big = permit.fee == null ? 'Visa' : formatMoney(permit.fee!.amount, permit.fee!.currency);
      bigCap = permit.fee == null ? '' : 'fee';
      final pw0 = permit.processingWeeks;
      bigBody = [
        if (pw0 != null) 'Processing ${pw0.min ?? '?'}–${pw0.max ?? '?'} weeks.',
        if (permit.fundsProof != null)
          'Proof of funds ${formatMoney(permit.fundsProof!.amount, permit.fundsProof!.currency)}${permit.fundsProof!.period == null ? '' : ' per ${permit.fundsProof!.period!.value}'}.',
        if (permit.workRights?.limit != null) 'Work: ${permit.workRights!.limit}.',
      ].join(' ');
      bigProv = permit.provenance;
    } else if (pw != null && s.kind == PlanStepKind.apply) {
      big = pw.applicationDeadline == null ? 'Apply' : formatDate(pw.applicationDeadline);
      bigCap = pw.applicationDeadline == null ? 'check the deadline on the programme page' : 'application deadline';
      bigBody = ps!.funding.isEmpty
          ? 'No funding options linked to this programme yet.'
          : 'Funding to apply for: ${ps.funding.map((f) => f.name).join(', ')}.';
      bigProv = pw.provenance;
    } else if (pw != null) {
      final tu = pw.tuition;
      big = tu == null
          ? 'Admission'
          : (tu.max == 0
                ? 'No tuition'
                : formatMoney(tu.min, tu.currency) +
                      (tu.max != tu.min ? ' – ${formatMoney(tu.max, tu.currency)}' : ''));
      bigCap = tu == null ? '' : 'tuition${tu.period == null ? '' : ' · ${tu.period!.value}'}';
      bigBody =
          '${pw.durationMonths ?? ''} months${pw.languageOfInstruction == null ? '' : ' · taught in ${pw.languageOfInstruction}'}${pw.mode == null ? '' : ' · ${pw.mode!.value.replaceAll('_', ' ')}'}';
      bigProv = pw.provenance;
    } else if (s.kind == 'grow') {
      big = s.barLabel.split(' · ').last;
      bigCap = '${formatYear(s.start)}–${formatYear(s.end)}';
      bigBody = s.key == 'grow:first-job'
          ? 'Your first role after the move. Use the Jobs tab and your job-search permit.'
          : 'The years that turn your first job into ${m.goal.title ?? 'your goal'}. Ask the coach which roles and skills lead there.';
    } else if (s.kind == 'goal') {
      big = 'Your goal';
      bigCap = formatYear(s.start);
      bigBody = 'Everything on the roadmap leads here.';
    }

    // ---- To do (chips) and Done when (checklist)
    final todo = <String>[
      if (req != null) ...[
        if (req.evidenceDocType != null) 'Get: ${req.evidenceDocType!.replaceAll('_', ' ')}',
        if (req.validityMonths != null) 'Valid ${req.validityMonths} months',
      ],
      if (ps?.kind == PlanStepKind.apply) ...[
        'Shortlist programmes',
        'Prepare documents',
        if (ps!.funding.isNotEmpty) 'Apply for funding',
      ],
      if (permit != null) ...['Book the appointment', 'Complete file only'],
      if (pw != null && (s.kind == PlanStepKind.study || s.kind == PlanStepKind.work)) ...[
        'Enrol / start',
        'Keep certificates',
      ],
    ];
    final done = <String>[
      if (permit != null) ...permit.checklist.map((i) => i.label ?? i.id ?? '').where((x) => x.isNotEmpty),
      if (req != null) ...['Requirement met (${req.label.en})', 'Proof uploaded to Documents'],
      if (ps?.kind == PlanStepKind.apply) ...['Applications submitted', 'Offer accepted'],
      if (pw != null && s.kind == PlanStepKind.study) ...['Enrolled', 'Degree certificate issued'],
      if (pw != null && s.kind == PlanStepKind.work) ...['Contract signed'],
      if (s.key == 'grow:first-job') 'Contract signed',
      if (s.key == 'grow:experience') ...['Next role reached', 'Skills for the goal role'],
      if (s.kind == 'goal') 'Goal reached',
    ];
    final checks = Map<String, dynamic>.from(m.progress['checks'] as Map? ?? const {});
    final next = m.steps.where((x) => x.number == s.number + 1).firstOrNull;

    // ---- costs on this step (every number with its provenance)
    final costs = <(String, String, Provenance)>[];
    if (pw?.tuition != null && pw!.tuition!.max > 0) {
      costs.add((
        'Tuition',
        '${formatMoney(pw.tuition!.min, pw.tuition!.currency)}${pw.tuition!.max != pw.tuition!.min ? ' – ${formatMoney(pw.tuition!.max, pw.tuition!.currency)}' : ''}${pw.tuition!.period == null ? '' : ' / ${pw.tuition!.period!.value}'}',
        pw.provenance,
      ));
    }
    if (pw != null && s.kind == PlanStepKind.study && country?.livingCostMonthly != null) {
      final l = country!.livingCostMonthly!;
      costs.add((
        'Living costs',
        '${formatMoney(l.min, l.currency)} – ${formatMoney(l.max, l.currency)} / month',
        country.provenance,
      ));
    }
    if (permit?.fee != null) {
      costs.add(('Visa fee', formatMoney(permit!.fee!.amount, permit.fee!.currency), permit.provenance));
    }
    if (permit?.fundsProof != null) {
      costs.add((
        'Proof of funds',
        '${formatMoney(permit!.fundsProof!.amount, permit.fundsProof!.currency)}${permit.fundsProof!.period == null ? '' : ' / ${permit.fundsProof!.period!.value}'}',
        permit.provenance,
      ));
    }
    if (req?.money != null) {
      costs.add((
        'Amount',
        '${formatMoney(req!.money!.amount, req.money!.currency)}${req.money!.period == null ? '' : ' / ${req.money!.period!.value}'}',
        req.provenance,
      ));
    }
    for (final f in ps?.funding ?? const <PlanFundingOption>[]) {
      final fd = c.funding.where((x) => x.id == f.id).firstOrNull;
      if (fd?.amount != null) {
        costs.add((
          fd!.name,
          '${formatMoney(fd.amount!.min, fd.amount!.currency)} – ${formatMoney(fd.amount!.max, fd.amount!.currency)}${fd.amount!.period == null ? '' : ' / ${fd.amount!.period!.value}'}',
          fd.provenance,
        ));
      }
    }

    Widget over(String s) => Padding(padding: const EdgeInsets.only(bottom: 6), child: OverLabel(s));

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: t.surface,
        border: Border.all(color: t.brand),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 10,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OverLabel('Step ${s.number} · ${phase.name}'),
                    Text(s.title, style: text.titleMedium),
                    Text('${formatYear(s.start)} – ${formatYear(s.end)}', style: text.bodySmall),
                  ],
                ),
              ),
              Wrap(
                spacing: 8,
                children: [
                  OutlinedButton.icon(
                    key: const Key('step-ask-coach'),
                    onPressed: () => ref.read(assistantProvider.notifier).openAbout('Step ${s.number}: ${s.title}', {'stepKey': s.key, 'phase': phase.name}),
                    icon: const Icon(Icons.chat_bubble_outline_rounded, size: 14),
                    label: const Text('Ask coach'),
                  ),
                  TextButton.icon(
                    onPressed: onClose,
                    icon: const Icon(Icons.close_rounded, size: 14),
                    label: const Text('Close'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, c2) {
              final cols = c2.maxWidth >= 660
                  ? 3
                  : c2.maxWidth >= 440
                  ? 2
                  : 1;
              final w = (c2.maxWidth - 20 * (cols - 1)) / cols;
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        over('Where'),
                        for (final (i, (title, cap, prov)) in where.indexed)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _OptionRow(
                              title: title,
                              caption: cap,
                              selected: whereChosen == i,
                              onTap: () => saveProgress(ref, goalId: goalId, section: 'where', key: s.key, value: i),
                              trailing: prov == null ? null : ProvenanceChip(prov, sourceName: src(prov)),
                            ),
                          ),
                        if (where.isEmpty) Text('—', style: text.bodySmall),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        over('Target'),
                        Text(
                          big,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: t.brand, height: 1.2),
                        ),
                        if (bigCap.isNotEmpty) Text(bigCap, style: text.bodySmall),
                        if (bigProv != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: ProvenanceChip(bigProv, sourceName: src(bigProv)),
                          ),
                        if (bigBody.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(bigBody, style: text.bodySmall),
                          ),
                        if (costs.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          over('Costs'),
                          for (final (label, value, prov) in costs)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8,
                                children: [
                                  Text('$label: ', style: text.bodySmall),
                                  Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                                  ProvenanceChip(prov, sourceName: src(prov)),
                                ],
                              ),
                            ),
                        ],
                        if (todo.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          over('To do'),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: [for (final x in todo) ToggleChip(label: x, selected: false, onTap: () {})],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        over('Done when'),
                        for (final (i, label) in done.indexed)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: InkWell(
                              onTap: () {
                                final v = (((checks['${s.key}|$i'] as num?)?.toInt() ?? 0) + 1) % 3;
                                saveProgress(ref, goalId: goalId, section: 'checks', key: '${s.key}|$i', value: v);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _Mark(status: (checks['${s.key}|$i'] as num?)?.toInt() ?? 0),
                                  const SizedBox(width: 10),
                                  Expanded(child: Text(label, style: const TextStyle(fontSize: 12))),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 8),
                        Text('Step status', style: text.bodySmall),
                        const SizedBox(height: 6),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Segmented<int>(
                            options: const [(0, 'Open'), (1, 'In progress'), (2, 'Done')],
                            value: m.statusOf(s),
                            onChanged: (v) => saveProgress(ref, goalId: goalId, section: 'steps', key: s.key, value: v),
                          ),
                        ),
                        if (next != null) ...[
                          const SizedBox(height: 12),
                          over('Unlocks'),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            onPressed: () => onOpen(next.key),
                            icon: const Icon(Icons.arrow_forward_rounded, size: 14),
                            label: Text('Step ${next.number} · ${next.title}'),
                            iconAlignment: IconAlignment.end,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  static String _requirementTarget(Requirement r) {
    final v = r.value;
    if (r.cefr != null && r.type == RequirementType.languageTest) return v is num ? 'Score $v' : r.cefr!.value;
    if (r.money != null) return formatMoney(r.money!.amount, r.money!.currency);
    if (v is num) return '${r.operator?.value ?? ''} $v'.trim();
    if (v is List) return v.join(' / ');
    if (v is String) return v;
    return 'Required';
  }

  static String _providerLabel(ProviderType p) => switch (p) {
    ProviderType.tutor => 'Tutor',
    ProviderType.languageSchool => 'Language school',
    ProviderType.testCentre => 'Test centre',
    ProviderType.coach => 'Coach',
    ProviderType.agency => 'Agency',
    ProviderType.universityOffice => 'University office',
    ProviderType.ngo => 'NGO',
  };
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.title,
    required this.caption,
    required this.selected,
    required this.onTap,
    this.trailing,
  });
  final String title, caption;
  final bool selected;
  final VoidCallback onTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? t.brandSoft : t.surface,
          border: Border.all(color: selected ? t.brand : t.line),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(top: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? t.brand : t.lineStrong, width: 1.5),
              ),
              child: selected
                  ? Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(color: t.brand, shape: BoxShape.circle),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  if (caption.isNotEmpty) Text(caption, style: Theme.of(context).textTheme.bodySmall),
                  if (trailing != null) Padding(padding: const EdgeInsets.only(top: 4), child: trailing),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Mark extends StatelessWidget {
  const _Mark({required this.status});
  final int status;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final (bg, fg, label) = switch (status) {
      2 => (t.ok, Colors.white, '✓'),
      1 => (t.warnSoft, t.warn, '…'),
      _ => (t.badSoft, t.bad, '✕'),
    };
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: fg),
      ),
    );
  }
}

class _Decision extends ConsumerWidget {
  const _Decision({required this.model, required this.decision});
  final RoadmapModel model;
  final RoadmapDecision decision;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final d = decision;
    final chosen = (model.decisionsChosen[d.id] as num?)?.toInt() ?? 0;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: t.line),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: phaseColor(context, d.phaseIndex), shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              OverLabel(d.year),
            ],
          ),
          const SizedBox(height: 8),
          Text(d.title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(d.body, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final (i, o) in d.options.indexed)
                ToggleChip(
                  label: o,
                  selected: chosen == i,
                  onTap: () => saveProgress(ref, goalId: model.goal.id!, section: 'decisions', key: d.id, value: i),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// `.note.warn / .note.info`
class _Note extends StatelessWidget {
  const _Note({required this.warn, required this.title, required this.body});
  final bool warn;
  final String title, body;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: warn ? t.warnSoft : t.brandSoft, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            warn ? Icons.warning_amber_rounded : Icons.auto_awesome_rounded,
            size: 18,
            color: warn ? t.warn : t.brand,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(body, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
