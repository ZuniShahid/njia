import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#finances` (docs/prototype-notes.md).
class FinancesView extends StatelessWidget {
  const FinancesView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Finances', caption: 'Overview, finance it, scenarios.');
}
