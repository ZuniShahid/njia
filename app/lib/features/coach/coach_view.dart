import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#coach` (docs/prototype-notes.md).
class CoachView extends StatelessWidget {
  const CoachView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Coach', caption: 'Path coach and study coach. Guides, never ghostwrites.');
}
