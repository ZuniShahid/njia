import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#map` (docs/prototype-notes.md).
class BigPictureView extends StatelessWidget {
  const BigPictureView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Big picture', caption: 'Nine pools: requirements, pathways, recognition, visa, money, jobs, helpers, trust, profile.');
}
