import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Goal create/edit (prototype: "Add goal" form in the goal switcher drawer). `goalId == 'new'` creates.
class GoalView extends StatelessWidget {
  const GoalView({super.key, required this.goalId});

  final String goalId;

  @override
  Widget build(BuildContext context) => SkeletonView(
        title: goalId == 'new' ? 'Add goal' : 'Edit goal',
        caption: 'Role, employer, country, city, target year, path type.',
      );
}
