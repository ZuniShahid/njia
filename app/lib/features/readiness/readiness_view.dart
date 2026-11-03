import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#readiness` (docs/prototype-notes.md).
class ReadinessView extends StatelessWidget {
  const ReadinessView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Readiness', caption: 'Score ring, dimensions and biggest levers.');
}
