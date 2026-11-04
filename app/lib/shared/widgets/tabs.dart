import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Prototype `.tabs/.tab`: text tabs with a 2 px brand underline, 22 px apart, scrollable.
class NjiaTabs<T> extends StatelessWidget {
  const NjiaTabs({super.key, required this.tabs, required this.value, required this.onChanged});
  final List<(T, String)> tabs;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final (i, (v, label)) in tabs.indexed)
              Padding(
                padding: EdgeInsets.only(left: i == 0 ? 0 : 22),
                child: Semantics(
                  selected: v == value,
                  button: true,
                  child: InkWell(
                    onTap: () => onChanged(v),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 10, 2, 9),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: v == value ? t.brand : Colors.transparent, width: 2))),
                      child: Text(label, style: TextStyle(fontWeight: v == value ? FontWeight.w600 : FontWeight.w400, color: v == value ? t.brand : t.muted)),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// `.tile`: surface card with caption, big value, caption.
class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.label, required this.value, this.caption, this.valueColor, this.chip});
  final String label;
  final String value;
  final String? caption;
  final Color? valueColor;
  final Widget? chip;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: t.surface, border: Border.all(color: t.line), borderRadius: BorderRadius.circular(NjiaTokens.radius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: text.bodySmall),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: valueColor ?? t.ink, fontFeatures: const [FontFeature.tabularFigures()])),
          if (caption != null) Text(caption!, style: text.bodySmall),
          if (chip != null) Padding(padding: const EdgeInsets.only(top: 4), child: chip),
        ],
      ),
    );
  }
}

/// `.kv`: label left, bold value right.
class KeyValueRow extends StatelessWidget {
  const KeyValueRow(this.label, this.value, {super.key, this.total = false, this.valueColor});
  final String label;
  final String value;
  final bool total;
  final Color? valueColor;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      padding: EdgeInsets.only(top: total ? 8 : 4, bottom: 4),
      decoration: total ? BoxDecoration(border: Border(top: BorderSide(color: t.line))) : null,
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(fontSize: total ? 14 : 12, fontWeight: total ? FontWeight.w600 : FontWeight.w400, color: total ? t.ink : t.muted))),
          Text(value, style: TextStyle(fontSize: 14, fontWeight: total ? FontWeight.w700 : FontWeight.w600, color: valueColor ?? t.ink, fontFeatures: const [FontFeature.tabularFigures()])),
        ],
      ),
    );
  }
}

/// `.mk` status mark used by readiness/visa/roadmap: 0 missing · 1 in progress · 2 done.
class StatusMark extends StatelessWidget {
  const StatusMark(this.status, {super.key, this.onTap, this.size = 20});
  final int status;
  final VoidCallback? onTap;
  final double size;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final (bg, fg, label) = switch (status) { 2 => (t.ok, Colors.white, '✓'), 1 => (t.warnSoft, t.warn, '…'), _ => (t.badSoft, t.bad, '✕') };
    final mark = Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Text(label, style: TextStyle(fontSize: size * 0.55, fontWeight: FontWeight.w800, color: fg, height: 1)),
    );
    if (onTap == null) return mark;
    return Semantics(button: true, label: 'Change status', child: InkWell(customBorder: const CircleBorder(), onTap: onTap, child: mark));
  }
}

/// `.note.warn / .note.info`
class NoteBox extends StatelessWidget {
  const NoteBox({super.key, required this.warn, required this.title, required this.body});
  final bool warn;
  final String title, body;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: warn ? t.warnSoft : t.brandSoft, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(warn ? Icons.warning_amber_rounded : Icons.auto_awesome_rounded, size: 18, color: warn ? t.warn : t.brand),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), Text(body, style: Theme.of(context).textTheme.bodySmall)])),
        ],
      ),
    );
  }
}
