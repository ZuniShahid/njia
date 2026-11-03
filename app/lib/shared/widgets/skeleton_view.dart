import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Placeholder body for a screen that is not ported yet (handover task 5). Mirrors the prototype's
/// center column: 32 px side padding, h1, short caption, 20 px gap between cards.
class SkeletonView extends StatelessWidget {
  const SkeletonView({super.key, required this.title, required this.caption, this.children = const []});

  final String title;
  final String caption;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(32, 28, 32, 56),
      children: [
        Text(title, style: text.headlineSmall),
        const SizedBox(height: 4),
        Text(caption, style: text.bodySmall),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Not built yet', style: text.titleMedium),
                const SizedBox(height: 6),
                Text('This view is ported from app/prototype/njia.html in the next step.', style: text.bodySmall),
              ],
            ),
          ),
        ),
        for (final c in children) ...[const SizedBox(height: 20), c],
      ],
    );
  }
}

/// Section label like the prototype's `.over` (11 px, bold, uppercase, muted).
class OverLabel extends StatelessWidget {
  const OverLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text.toUpperCase(), style: Theme.of(context).textTheme.labelSmall?.copyWith(color: context.tokens.muted));
}
