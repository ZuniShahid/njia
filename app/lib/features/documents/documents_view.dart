import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#documents` (docs/prototype-notes.md).
class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Documents', caption: 'Checklist by category with status, upload and expiry.');
}
