import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#visa` (docs/prototype-notes.md).
class VisaView extends StatelessWidget {
  const VisaView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Visa & residence', caption: 'Permit types, fees, processing time, work rights – each with a provenance chip.');
}
