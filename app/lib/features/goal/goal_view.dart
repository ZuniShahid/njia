// /goal/new and /goal/:id – the goal form as a full page (deep links); the drawer uses the same form.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../core/models/models.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import 'goal_constants.dart';
import 'goal_form.dart';
import 'goal_title.dart';

class GoalView extends ConsumerWidget {
  const GoalView({super.key, required this.goalId});
  final String goalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNew = goalId == 'new';
    final goals = ref.watch(goalsProvider);
    final existing = goals.value?.where((g) => g.id == goalId).firstOrNull;
    if (!isNew && goals.isLoading) return const Center(child: CircularProgressIndicator());
    if (!isNew && existing == null) {
      return const ViewScaffold(center: [PageHead(over: 'Goal', title: 'Goal not found', caption: 'It may have been deleted.')]);
    }
    return ViewScaffold(
      centerMaxWidth: 720,
      center: [
        PageHead(
          over: 'Your goal',
          title: isNew ? 'Add a goal' : 'Edit goal',
          caption: isNew ? 'Up to $maxGoals goals. The cockpit follows the active one.' : goalTitle(existing!),
        ),
        NjiaCard(
          children: [
            GoalForm(
              initial: isNew ? emptyGoal : existing!,
              isNew: isNew,
              onCancel: () => context.go(Routes.cockpit),
              onSubmit: (Goal g) async {
                final uid = ref.read(currentUidProvider);
                if (uid == null) return;
                final repo = ref.read(userRepositoryProvider);
                final id = await repo.saveGoal(uid, g);
                if (isNew) await repo.updateProfile(uid, {'activeGoalId': id});
                if (!context.mounted) return;
                toast(context, isNew ? 'Goal added. The cockpit now follows: ${goalTitle(g)}' : 'Goal updated');
                context.go(Routes.cockpit);
              },
            ),
          ],
        ),
      ],
    );
  }
}
