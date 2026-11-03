// Prototype `cockpit()`: greeting + open tasks, hero card (goal, metrics, phase strip), next milestone,
// "This week" tasks, mini Gantt; right panel: your chances, next best action, upcoming deadlines.
// All numbers come from the plan (server plan, or the Dart engine until the server has computed it).
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/roadmap_model.dart';
import '../../shared/format.dart';
import '../../shared/widgets/gantt.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import '../goal/goal_drawer.dart';
import '../goal/goal_title.dart';

class CockpitView extends ConsumerWidget {
  const CockpitView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(activeGoalProvider);
    final goals = ref.watch(goalsProvider).value ?? const [];
    final profile = ref.watch(profileProvider).value;
    final firstName = (profile?.displayName ?? '').split(' ').first;
    final text = Theme.of(context).textTheme;
    if (ref.watch(goalsProvider).isLoading) return const Center(child: CircularProgressIndicator());
    if (goal == null) {
      return ViewScaffold(center: [
        PageHead(over: 'Cockpit', title: 'Welcome${firstName.isEmpty ? '' : ', $firstName'}', caption: 'Add your first goal to get a roadmap.'),
        NjiaCard(children: [
          Text('No goal yet', style: text.titleMedium),
          Text('Tell us the job you want, where and by when. The roadmap, costs and visa steps follow from that.', style: text.bodySmall),
          FilledButton.icon(onPressed: () => showGoalDrawer(context, mode: GoalDrawerMode.create), icon: const Icon(Icons.add_rounded, size: 16), label: const Text('Add a goal')),
        ]),
      ]);
    }
    final roadmap = ref.watch(roadmapProvider);
    return roadmap.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(center: [PageHead(over: 'Cockpit', title: 'Something went wrong', caption: '$e')]),
      data: (m) => m == null
          ? ViewScaffold(center: [const PageHead(over: 'Cockpit', title: 'Computing your roadmap…', caption: 'This takes a moment after a goal is saved.')])
          : _Cockpit(model: m, goalIndex: goals.indexWhere((g) => g.id == goal.id) + 1, goalCount: goals.length, firstName: firstName),
    );
  }
}

class _Cockpit extends ConsumerWidget {
  const _Cockpit({required this.model, required this.goalIndex, required this.goalCount, required this.firstName});
  final RoadmapModel model;
  final int goalIndex;
  final int goalCount;
  final String firstName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final m = model;
    final goal = m.goal;
    final ms = m.milestone;
    final tasks = m.tasks;
    final open = tasks.where((s) => !m.isDone(s)).length;
    final country = m.content.countries.where((c) => c.id == goal.countryId).firstOrNull?.name.en ?? goal.countryId ?? '';
    final hour = m.now.hour;
    final greeting = hour < 12 ? 'Good morning' : hour < 18 ? 'Good afternoon' : 'Good evening';
    final chances = m.chances;
    final nba = m.nextBestAction;

    return ViewScaffold(
      center: [
        PageHead(
          over: 'Cockpit · ${weekdayName(m.now)}, ${formatDate(m.now.toIso8601String())}',
          title: '$greeting${firstName.isEmpty ? '' : ', $firstName'}',
          caption: '$open open task${open == 1 ? '' : 's'} this week · next milestone ${formatYear(ms.due)}',
        ),
        // hero
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: t.nav, borderRadius: BorderRadius.circular(NjiaTokens.radius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverLabel('Goal $goalIndex of $goalCount', color: t.navMuted),
                        const SizedBox(height: 4),
                        Text(goalTitle(goal), style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: t.navInk, height: 1.25)),
                        Text('${goalLocation(goal, country)} · target ${goal.targetYear ?? ''}', style: TextStyle(fontSize: 12, color: t.navMuted)),
                      ],
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => showGoalDrawer(context),
                    style: OutlinedButton.styleFrom(foregroundColor: t.navInk, backgroundColor: Colors.transparent, side: BorderSide(color: t.navMuted), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    icon: const Icon(Icons.expand_more_rounded, size: 14),
                    label: const Text('Switch or edit'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, c) {
                  final metrics = [
                    ('${m.yearsToGoal} yrs', 'to goal'),
                    ('${m.stepsDone} / ${m.stepsTotal}', 'steps done'),
                    ('${m.phases.indexOf(m.currentPhase) + 1} / ${m.phases.length}', 'current phase'),
                    ('${m.plan.scores.readiness}', 'readiness'),
                  ];
                  final w = (c.maxWidth - 36) / 4;
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for (final (v, l) in metrics)
                        SizedBox(
                          width: w < 110 ? (c.maxWidth - 12) / 2 : w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(v, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: t.navInk, height: 1.2, fontFeatures: const [FontFeature.tabularFigures()])),
                              Text(l, style: TextStyle(fontSize: 12, color: t.navMuted)),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  for (final p in m.phases)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: p == m.currentPhase ? t.accent : phaseColor(context, p.index).withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(p.shortName, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: p == m.currentPhase ? t.navInk : t.navMuted)),
                            Text('${p.start.floor()}–${p.end.floor().toString().substring(2)}', style: TextStyle(fontSize: 12, color: t.navMuted)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        // next milestone
        NjiaCard(
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const OverLabel('Next milestone'),
                    Text(ms.title, style: text.titleLarge),
                    Text('${formatYear(ms.due)} · ${ms.done} of ${ms.items.length} done', style: text.bodySmall),
                  ],
                ),
                FilledButton.icon(onPressed: () => context.go(Routes.milestone), icon: const Icon(Icons.arrow_forward_rounded, size: 14), label: const Text('Open checklist')),
              ],
            ),
            ProgressBar(ms.items.isEmpty ? 0 : ms.done / ms.items.length, height: 8),
            Column(
              children: [
                for (final s in ms.next)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        _Mark(status: m.statusOf(s)),
                        const SizedBox(width: 12),
                        Expanded(child: Text(s.title)),
                        Text('by ${formatYear(s.end)}', style: text.bodySmall),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
        // this week + roadmap
        LayoutBuilder(
          builder: (context, c) {
            final two = c.maxWidth >= 720;
            final week = NjiaCard(
              gap: 4,
              children: [
                _cardHead(context, 'This week', '$open open · ${tasks.length - open} done'),
                for (final (i, s) in tasks.indexed)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(border: i < tasks.length - 1 ? Border(bottom: BorderSide(color: t.line)) : null),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Checkbox(
                          checked: m.isDone(s),
                          onChanged: (v) => saveProgress(ref, goalId: goal.id!, section: 'steps', key: s.key, value: v ? 2 : 0),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(s.title, style: TextStyle(decoration: m.isDone(s) ? TextDecoration.lineThrough : null, color: m.isDone(s) ? t.muted : t.ink)),
                              Text('Step ${s.number} · ${m.phases[s.phaseIndex - 1].shortName}', style: text.bodySmall),
                            ],
                          ),
                        ),
                        if (!m.isDone(s) && s.end < m.todayYear + 0.5) const NjiaBadge('Due soon', tone: BadgeTone.warn),
                      ],
                    ),
                  ),
                if (tasks.isEmpty) Text('Nothing due in the next three months.', style: text.bodySmall),
              ],
            );
            final road = NjiaCard(
              children: [
                _cardHead(context, 'Roadmap', '${m.phases.length} phases · today marked', action: TextButton(onPressed: () => context.go(Routes.roadmap), child: const Text('Open'))),
                MiniGantt(model: m),
              ],
            );
            if (two) return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: week), const SizedBox(width: 20), Expanded(child: road)]);
            return Column(children: [week, const SizedBox(height: 20), road]);
          },
        ),
      ],
      right: [
        Section(
          children: [
            Text('Your chances', style: text.titleMedium),
            Row(
              children: [
                Expanded(child: _Score(label: 'Feasibility', value: '${chances.feasibility}', unit: '/100', fraction: chances.feasibility / 100, color: t.brand, note: chances.feasibilityNote)),
                const SizedBox(width: 12),
                Expanded(child: _Score(label: 'Difficulty', value: chances.difficulty.toStringAsFixed(1), unit: '/5', fraction: (chances.difficulty - 1) / 4, color: t.accent, note: chances.difficultyNote)),
              ],
            ),
            for (final d in m.drivers)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(d.positive ? Icons.check_circle_outline_rounded : Icons.error_outline_rounded, size: 16, color: d.positive ? t.ok : t.warn),
                  const SizedBox(width: 8),
                  Expanded(child: Text(d.text, style: const TextStyle(fontSize: 12))),
                ],
              ),
            Text('Scores are computed from your profile and the content behind each step; they are estimates, not promises.', style: text.bodySmall),
          ],
        ),
        if (nba != null)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: t.brandSoft, borderRadius: BorderRadius.circular(NjiaTokens.radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Icon(Icons.auto_awesome_rounded, size: 18, color: t.brand), const SizedBox(width: 8), Text('Next best action', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.brand))]),
                const SizedBox(height: 10),
                Text(nba.title, style: text.titleMedium),
                const SizedBox(height: 4),
                Text(nba.body, style: text.bodySmall),
                const SizedBox(height: 10),
                FilledButton(
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  onPressed: () => context.go(nba.step == null ? Routes.roadmap : '${Routes.roadmap}?step=${Uri.encodeComponent(nba.step!.key)}'),
                  child: const Text('Plan it'),
                ),
              ],
            ),
          ),
        Section(
          gap: 2,
          children: [
            Padding(padding: const EdgeInsets.only(bottom: 6), child: Text('Upcoming deadlines', style: text.titleMedium)),
            if (m.deadlines.isEmpty) Text('No dated deadlines on your route yet.', style: text.bodySmall),
            for (final d in m.deadlines)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 46,
                      decoration: BoxDecoration(color: t.subtle, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(monthShort(d.date).toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.6, color: t.muted)),
                          Text('${d.date.day}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(d.title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(d.caption, style: text.bodySmall)],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _cardHead(BuildContext context, String title, String caption, {Widget? action}) {
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: text.titleMedium), Text(caption, style: text.bodySmall)])),
        ?action,
      ],
    );
  }
}

/// `.mk`: 20 px status mark (miss / prog / ok).
class _Mark extends StatelessWidget {
  const _Mark({required this.status});
  final int status;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final (bg, fg, label) = switch (status) { 2 => (t.ok, Colors.white, '✓'), 1 => (t.warnSoft, t.warn, '…'), _ => (t.badSoft, t.bad, '!') };
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: fg)),
    );
  }
}

/// `.cb`: 18 px rounded checkbox.
class _Checkbox extends StatelessWidget {
  const _Checkbox({required this.checked, required this.onChanged});
  final bool checked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Semantics(
      checked: checked,
      label: 'Mark done',
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => onChanged(!checked),
        child: Container(
          width: 18,
          height: 18,
          margin: const EdgeInsets.only(top: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: checked ? t.brand : t.surface, borderRadius: BorderRadius.circular(5), border: Border.all(color: checked ? t.brand : t.lineStrong, width: 1.5)),
          child: checked ? Text('✓', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: t.onBrand, height: 1)) : null,
        ),
      ),
    );
  }
}

/// `.score`: label, big number, bar, note.
class _Score extends StatelessWidget {
  const _Score({required this.label, required this.value, required this.unit, required this.fraction, required this.color, required this.note});
  final String label, value, unit, note;
  final double fraction;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(border: Border.all(color: t.line), borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OverLabel(label),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              text: value,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: color, height: 1, fontFamily: NjiaTokens.fontFamily),
              children: [TextSpan(text: ' $unit', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: t.muted))],
            ),
          ),
          const SizedBox(height: 6),
          ProgressBar(fraction, color: color),
          const SizedBox(height: 6),
          Text(note, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
