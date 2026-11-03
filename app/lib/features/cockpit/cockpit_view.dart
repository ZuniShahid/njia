import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#cockpit` (docs/prototype-notes.md).
class CockpitView extends StatelessWidget {
  const CockpitView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Cockpit', caption: 'Your goal, open tasks, next milestone and this week.');
}
