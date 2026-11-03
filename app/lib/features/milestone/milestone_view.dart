import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#milestone` (docs/prototype-notes.md).
class MilestoneView extends StatelessWidget {
  const MilestoneView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Next milestone', caption: 'Checklist grouped by area, with help buttons.');
}
