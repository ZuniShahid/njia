import 'package:flutter/material.dart';

import '../../shared/widgets/skeleton_view.dart';

/// Prototype view `#profile` (docs/prototype-notes.md).
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) =>
      const SkeletonView(title: 'Profile', caption: 'About you, education, languages, experience, money, mobility.');
}
