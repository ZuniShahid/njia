import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#roadmap` (docs/prototype-notes.md).
class RoadmapView extends StatelessWidget {
  const RoadmapView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Roadmap', caption: 'Phases × years, decision points and watch-outs.');
}
