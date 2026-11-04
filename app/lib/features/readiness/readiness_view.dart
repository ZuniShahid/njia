// Prototype `readiness()`: overall score, one card per dimension with tick-able requirements
// (+points each), right panel "Biggest levers" and "By area". Items are the route's requirements
// evaluated against the profile; a tick writes the satisfying fact and asks the server to recompute.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../core/engine/engine.dart';
import '../../core/engine/readiness_model.dart';
import '../../shared/widgets/provenance_chip.dart';
import '../../shared/widgets/tabs.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';

const _dimIcon = {
  'education': Icons.school_outlined,
  'languages': Icons.public_rounded,
  'experience': Icons.work_outline_rounded,
  'finances': Icons.account_balance_wallet_outlined,
  'visa': Icons.badge_outlined,
};
const _dimColor = {'education': 0, 'languages': 1, 'experience': 3, 'finances': 4, 'visa': 2};

class ReadinessView extends ConsumerWidget {
  const ReadinessView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(activeGoalProvider);
    if (goal == null) {
      return const ViewScaffold(center: [PageHead(over: 'Your path', title: 'Readiness', caption: 'Add a goal first; readiness is measured against its route.')]);
    }
    final model = ref.watch(readinessProvider);
    return model.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(center: [PageHead(over: 'Your path', title: 'Readiness', caption: '$e')]),
      data: (m) => m == null ? const Center(child: CircularProgressIndicator()) : _Readiness(model: m),
    );
  }
}

class _Readiness extends ConsumerWidget {
  const _Readiness({required this.model});
  final ReadinessModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final m = model;
    final sources = ref.watch(sourceNamesProvider).value ?? const <String, String>{};

    return ViewScaffold(
      center: [
        const PageHead(over: 'Your path', title: 'Readiness', caption: "Tick what you've done. The score updates."),
        NjiaCard(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 24,
              runSpacing: 12,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const OverLabel('Overall'),
                    RichText(
                      text: TextSpan(
                        text: '${m.overall}',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: t.brand, height: 1.2, fontFamily: NjiaTokens.fontFamily),
                        children: [TextSpan(text: ' / 100', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: t.muted))],
                      ),
                    ),
                  ],
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 200, maxWidth: 520),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProgressBar(m.overall / 100, height: 10),
                      const SizedBox(height: 6),
                      Text('Every requirement on your route counts the same; one you have not checked yet counts half.', style: text.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        LayoutBuilder(
          builder: (context, c) {
            final two = c.maxWidth >= 720;
            final w = two ? (c.maxWidth - 20) / 2 : c.maxWidth;
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (final d in m.dimensions) SizedBox(key: ValueKey('dim-${d.key}'), width: w, child: _DimensionCard(dimension: d, sources: sources)),
                if (m.dimensions.isEmpty) Text('No requirements on this route yet.', style: text.bodySmall),
              ],
            );
          },
        ),
      ],
      right: [
        Section(
          children: [
            Text('Biggest levers', style: text.titleMedium),
            Text('Open items that raise your score most', style: text.bodySmall),
            for (final l in m.levers)
              ListRow(
                icon: _dimIcon[ReadinessModel.dimensionOf(l.requirement.type)],
                title: l.requirement.label.en,
                subtitle: ReadinessModel.dimensionLabels[ReadinessModel.dimensionOf(l.requirement.type)],
                trailing: [NjiaBadge('+${l.weight}', tone: BadgeTone.brand)],
              ),
            if (m.levers.isEmpty) Text('Everything on the route is met.', style: text.bodySmall),
          ],
        ),
        Section(
          children: [
            Text('By area', style: text.titleMedium),
            for (final d in m.dimensions) KeyValueRow(d.label, '${d.score}%'),
          ],
        ),
      ],
    );
  }
}

class _DimensionCard extends ConsumerWidget {
  const _DimensionCard({required this.dimension, required this.sources});
  final ReadinessDimension dimension;
  final Map<String, String> sources;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final d = dimension;
    final color = t.phases[_dimColor[d.key] ?? 0];
    return NjiaCard(
      gap: 10,
      children: [
        Row(
          children: [
            IconBox(_dimIcon[d.key] ?? Icons.check_rounded),
            const SizedBox(width: 10),
            Expanded(child: Text(d.label, style: text.titleMedium)),
            Text('${d.score}%', style: const TextStyle(fontWeight: FontWeight.w700, fontFeatures: [FontFeature.tabularFigures()])),
          ],
        ),
        ProgressBar(d.score / 100, color: color),
        Column(
          children: [
            for (final (i, it) in d.items.indexed)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(border: i < d.items.length - 1 ? Border(bottom: BorderSide(color: t.line)) : null),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      checked: it.met,
                      label: 'Toggle',
                      child: InkWell(
                        key: ValueKey('tick-${it.requirement.id}'),
                        borderRadius: BorderRadius.circular(5),
                        onTap: () => setRequirementMet(ref, requirement: it.requirement, met: !it.met),
                        child: Container(
                          width: 18,
                          height: 18,
                          margin: const EdgeInsets.only(top: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: it.met ? t.brand : it.status == RequirementStatus.unknown ? t.warnSoft : t.surface,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: it.met ? t.brand : it.status == RequirementStatus.unknown ? t.warn : t.lineStrong, width: 1.5),
                          ),
                          child: it.met ? Text('✓', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: t.onBrand, height: 1)) : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(it.requirement.label.en, style: TextStyle(decoration: it.met ? TextDecoration.lineThrough : null, color: it.met ? t.muted : t.ink)),
                          if (it.status == RequirementStatus.unknown) Text('Not checked yet – tick it if you have it, or fill your profile.', style: text.bodySmall),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: ProvenanceChip(it.requirement.provenance, sourceName: sources[it.requirement.provenance.sourceId]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('+${it.weight}', style: text.bodySmall?.copyWith(fontFeatures: const [FontFeature.tabularFigures()])),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
