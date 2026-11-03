import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#jobs` (docs/prototype-notes.md).
class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Jobs', caption: 'Search and filters; jobs come from APIs and partner feeds only.');
}
