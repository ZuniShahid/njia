// Getting started: five short steps after the first goal, each checked against real data (no
// self-reported ticks), so the student sees progress the moment they act. Shown on the cockpit until
// done or hidden; a welcome dialog introduces it once. State lives in users/{uid}.progress[goalId].guide.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/roadmap_model.dart';
import '../../core/models/models.dart';
import '../../shared/widgets/ui.dart';

class GuideStep {
  const GuideStep({required this.key, required this.title, required this.why, required this.route, required this.action, required this.done});
  final String key;
  final String title;
  final String why;
  final String route;
  final String action;
  final bool done;
}

/// The five steps, in the order that makes the plan more accurate fastest.
List<GuideStep> guideSteps({required UserProfile? profile, required List<UserDocument> documents, required RoadmapModel roadmap}) {
  final p = profile;
  final guide = Map<String, dynamic>.from(roadmap.progress['guide'] as Map? ?? const {});
  final started = [
    ...Map<String, dynamic>.from(roadmap.progress['steps'] as Map? ?? const {}).values,
    ...Map<String, dynamic>.from(roadmap.progress['checks'] as Map? ?? const {}).values,
  ].any((v) => v is num && v >= 1);
  return [
    GuideStep(
      key: 'profile',
      title: 'Tell us about you',
      why: 'Education, languages, passport. Your readiness score uses them.',
      route: Routes.profile,
      action: 'Open profile',
      done: p != null && p.education.isNotEmpty && p.languages.isNotEmpty && (p.passportValidUntil ?? '').isNotEmpty,
    ),
    GuideStep(
      key: 'documents',
      title: 'Add your certificates',
      why: 'Transcripts, test results, passport copy. Ready when you apply.',
      route: Routes.documents,
      action: 'Upload',
      done: documents.isNotEmpty,
    ),
    GuideStep(
      key: 'money',
      title: 'Add your money',
      why: 'Savings and family support. We show the gap and matching scholarships.',
      route: Routes.finances,
      action: 'Open finances',
      done: p != null && (p.savings != null || p.monthlySupport != null),
    ),
    GuideStep(
      key: 'roadmap',
      title: 'Walk through your roadmap',
      why: 'Every step with what it needs and its source.',
      route: Routes.roadmap,
      action: 'Open roadmap',
      done: guide['roadmap'] == true,
    ),
    GuideStep(
      key: 'milestone',
      title: 'Start your next milestone',
      why: 'Pick one task for this week and set it to In progress.',
      route: Routes.milestone,
      action: 'Pick a task',
      done: started,
    ),
  ];
}

class GettingStartedCard extends ConsumerWidget {
  const GettingStartedCard({super.key, required this.model});
  final RoadmapModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guide = Map<String, dynamic>.from(model.progress['guide'] as Map? ?? const {});
    if (guide['hidden'] == true) return const SizedBox.shrink();
    final steps = guideSteps(profile: ref.watch(profileProvider).value, documents: ref.watch(documentsProvider).value ?? const [], roadmap: model);
    final done = steps.where((s) => s.done).length;
    final next = steps.where((s) => !s.done).firstOrNull;
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final goalId = model.goal.id;
    void hide() {
      if (goalId != null) saveProgress(ref, goalId: goalId, section: 'guide', key: 'hidden', value: true);
    }

    return NjiaCard(
      key: const Key('getting-started'),
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverLabel(next == null ? 'All set' : 'Getting started · $done of ${steps.length}'),
                  const SizedBox(height: 2),
                  Text(next == null ? 'Your plan is yours now' : 'Make the plan yours', style: text.titleMedium),
                ],
              ),
            ),
            TextButton(onPressed: hide, child: Text(next == null ? 'Close' : 'Hide')),
          ],
        ),
        ProgressBar(done / steps.length, height: 6, color: t.ok),
        if (next == null)
          Text('Keep it moving: one task a week. The cockpit shows what is next.', style: text.bodySmall)
        else
          Column(
            children: [
              for (final (i, s) in steps.indexed)
                _GuideRow(index: i + 1, step: s, isNext: identical(s, next), onGo: () => context.go(s.route)),
            ],
          ),
      ],
    );
  }
}

class _GuideRow extends StatelessWidget {
  const _GuideRow({required this.index, required this.step, required this.isNext, required this.onGo});
  final int index;
  final GuideStep step;
  final bool isNext;
  final VoidCallback onGo;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: step.done ? t.ok : (isNext ? t.brand : t.subtle), shape: BoxShape.circle),
            child: step.done
                ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
                : Text('$index', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: isNext ? t.onBrand : t.ink)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: step.done ? t.muted : t.ink, decoration: step.done ? TextDecoration.lineThrough : null),
                ),
                if (!step.done) Text(step.why, style: text.bodySmall),
              ],
            ),
          ),
          if (!step.done) ...[
            const SizedBox(width: 8),
            isNext ? FilledButton(onPressed: onGo, child: Text(step.action)) : TextButton(onPressed: onGo, child: Text(step.action)),
          ],
        ],
      ),
    );
  }
}

/// Shown once after the first goal: what the plan is and the five steps ahead.
Future<void> showWelcomeGuide(BuildContext context, WidgetRef ref, RoadmapModel model) async {
  final goalId = model.goal.id;
  if (goalId == null) return;
  await saveProgress(ref, goalId: goalId, section: 'guide', key: 'welcomed', value: true);
  if (!context.mounted) return;
  final years = model.yearsToGoal;
  final steps = guideSteps(profile: ref.read(profileProvider).value, documents: ref.read(documentsProvider).value ?? const [], roadmap: model);
  final go = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final text = Theme.of(ctx).textTheme;
      final t = ctx.tokens;
      return AlertDialog(
        key: const Key('welcome-guide'),
        title: const Text('Your roadmap is ready'),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.stepsTotal} steps${years > 0 ? ' over $years years' : ''} to ${model.goal.title ?? 'your goal'}. Five short steps make it yours. Most take two minutes.',
                style: text.bodyMedium,
              ),
              const SizedBox(height: 14),
              for (final (i, s) in steps.indexed)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(width: 22, child: Text('${i + 1}.', style: TextStyle(fontWeight: FontWeight.w700, color: t.brand))),
                    Expanded(child: Text(s.title, style: const TextStyle(fontWeight: FontWeight.w600))),
                  ]),
                ),
              const SizedBox(height: 4),
              Text('You find the list on your cockpit.', style: text.bodySmall),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Later')),
          FilledButton(key: const Key('welcome-start'), onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Start with step 1')),
        ],
      );
    },
  );
  if (go == true && context.mounted) context.go(steps.first.route);
}
