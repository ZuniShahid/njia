import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Center column + optional right panel. ≥ 1181 px: side by side (340 px panel, surface background,
/// 1 px line on the left, scrolls independently); below: the panel content follows the center
/// column (task 6 turns it into a slide-in sheet).
class ViewScaffold extends StatelessWidget {
  const ViewScaffold({super.key, required this.center, this.right, this.centerMaxWidth});

  final List<Widget> center;
  final List<Widget>? right;
  final double? centerMaxWidth;

  static const _centerPadding = EdgeInsets.fromLTRB(32, 28, 32, 56);
  static const _narrowPadding = EdgeInsets.fromLTRB(16, 20, 16, 32);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final wide = c.maxWidth >= NjiaTokens.wide - 240; // shell already took the 240 px nav
        final narrow = c.maxWidth <= NjiaTokens.narrow;
        final pad = narrow ? _narrowPadding : _centerPadding;
        final centerList = ListView(
          padding: centerMaxWidth == null || c.maxWidth <= centerMaxWidth! + pad.horizontal
              ? pad
              : pad.copyWith(right: c.maxWidth - centerMaxWidth! - pad.left),
          children: [
            for (var i = 0; i < center.length; i++) ...[if (i > 0) const SizedBox(height: 20), center[i]],
            if (right != null && !wide) ...[
              const SizedBox(height: 28),
              for (var i = 0; i < right!.length; i++) ...[if (i > 0) const SizedBox(height: 26), right![i]],
            ],
          ],
        );
        if (right == null || !wide) return centerList;
        final t = context.tokens;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: centerList),
            Container(
              width: 340,
              decoration: BoxDecoration(color: t.surface, border: Border(left: BorderSide(color: t.line))),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 56),
                children: [
                  for (var i = 0; i < right!.length; i++) ...[if (i > 0) const SizedBox(height: 26), right![i]],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
