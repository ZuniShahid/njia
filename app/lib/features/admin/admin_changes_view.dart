import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Review queue: changeRequests where status == pending. Editors/admins only (custom claim `role`).
/// Rule 1 in CLAUDE.md: nothing about visas, recognition or money goes live without human approval.
class AdminChangesView extends StatelessWidget {
  const AdminChangesView({super.key});

  @override
  Widget build(BuildContext context) => const SkeletonView(
        title: 'Review queue',
        caption: 'Pending change requests: before / after / diff / source quote. Approve or reject.',
      );
}
