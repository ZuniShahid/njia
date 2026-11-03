// Small building blocks ported from the prototype CSS: .phead, .badge, .av, .aitem, .chip, .dlist,
// .fld/.inp, .sect, .lr, .bar, toast. Keep them dumb; screens compose them.
import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// `.phead`: overline · h1 · caption, with optional action buttons on the right.
class PageHead extends StatelessWidget {
  const PageHead({super.key, required this.over, required this.title, this.caption, this.actions = const []});
  final String over;
  final String title;
  final String? caption;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.end,
      runSpacing: 12,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            OverLabel(over),
            Text(title, style: text.headlineSmall),
            if (caption != null) Padding(padding: const EdgeInsets.only(top: 2), child: Text(caption!, style: text.bodySmall)),
          ],
        ),
        if (actions.isNotEmpty) Wrap(spacing: 10, runSpacing: 10, children: actions),
      ],
    );
  }
}

/// `.over`: 11 px, bold, uppercase, muted.
class OverLabel extends StatelessWidget {
  const OverLabel(this.text, {super.key, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) => Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color ?? context.tokens.muted),
      );
}

enum BadgeTone { ok, warn, bad, neutral, brand, info }

/// `.badge.b-*`
class NjiaBadge extends StatelessWidget {
  const NjiaBadge(this.text, {super.key, this.tone = BadgeTone.neutral});
  final String text;
  final BadgeTone tone;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final (fg, bg) = switch (tone) {
      BadgeTone.ok => (t.ok, t.okSoft),
      BadgeTone.warn => (t.warn, t.warnSoft),
      BadgeTone.bad => (t.bad, t.badSoft),
      BadgeTone.neutral => (t.muted, t.subtle),
      BadgeTone.brand => (t.brand, t.brandSoft),
      BadgeTone.info => (t.info, t.infoSoft),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(NjiaTokens.radiusChip)),
      child: Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fg)),
    );
  }
}

/// `.av`: initials in a purple circle.
class Avatar extends StatelessWidget {
  const Avatar(this.name, {super.key, this.size = 32});
  final String name;
  final double size;

  static String initials(String name) =>
      name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).take(2).map((w) => w[0].toUpperCase()).join();

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: context.tokens.phases[2], shape: BoxShape.circle),
        child: Text(initials(name), style: TextStyle(fontSize: size * 0.36, fontWeight: FontWeight.w700, color: Colors.white)),
      );
}

/// `.ibox`: 32 px rounded square with a brand-tinted icon.
class IconBox extends StatelessWidget {
  const IconBox(this.icon, {super.key});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(color: t.brandSoft, borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, size: 16, color: t.brand),
    );
  }
}

/// `.card`: surface, 1 px line, 14 px radius, 20 px padding, 14 px gap between children.
class NjiaCard extends StatelessWidget {
  const NjiaCard({super.key, required this.children, this.padding = const EdgeInsets.all(20), this.gap = 14, this.crossAxisAlignment = CrossAxisAlignment.start});
  final List<Widget> children;
  final EdgeInsets padding;
  final double gap;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: padding,
          child: Column(crossAxisAlignment: crossAxisAlignment, mainAxisSize: MainAxisSize.min, children: _gap(children, gap)),
        ),
      );
}

List<Widget> _gap(List<Widget> items, double gap) => [
      for (var i = 0; i < items.length; i++) ...[if (i > 0) SizedBox(height: gap), items[i]],
    ];

/// `.sect`: vertical stack with 10 px gap.
class Section extends StatelessWidget {
  const Section({super.key, required this.children, this.gap = 10});
  final List<Widget> children;
  final double gap;
  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: _gap(children, gap));
}

/// `.aitem/.ahead/.abody`: accordion card. Open state is owned by the parent.
class AccordionItem extends StatelessWidget {
  const AccordionItem({super.key, required this.title, required this.subtitle, required this.open, required this.onToggle, required this.body});
  final String title;
  final String subtitle;
  final bool open;
  final VoidCallback onToggle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: t.surface,
        borderRadius: BorderRadius.circular(NjiaTokens.radius),
        border: Border.all(color: open ? t.brand : t.line, width: open ? 2 : 1),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(NjiaTokens.radius),
            onTap: onToggle,
            child: Semantics(
              button: true,
              expanded: open,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                          Text(subtitle, style: text.bodySmall),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: open ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(Icons.expand_more_rounded, color: t.muted),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (open)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(border: Border(top: BorderSide(color: t.line))),
                child: body,
              ),
            ),
        ],
      ),
    );
  }
}

/// `.chip[aria-pressed]`: toggle chip; `onRemove` adds the small × for custom chips.
class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key, required this.label, required this.selected, required this.onTap, this.onRemove});
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Semantics(
          button: true,
          toggled: selected,
          child: InkWell(
            borderRadius: BorderRadius.circular(NjiaTokens.radiusChip),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: selected ? t.brandSoft : t.surface,
                borderRadius: BorderRadius.circular(NjiaTokens.radiusChip),
                border: Border.all(color: selected ? Colors.transparent : t.line),
              ),
              child: Text(label, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: selected ? FontWeight.w600 : FontWeight.w500, color: selected ? t.brand : t.ink)),
            ),
          ),
        ),
        ),
        if (onRemove != null)
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close_rounded, size: 12),
            tooltip: 'Remove $label',
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
          ),
      ],
    );
  }
}

/// `.dlist`: two-column definition list (118 px label column).
class KeyValueList extends StatelessWidget {
  const KeyValueList(this.rows, {super.key});
  final List<(String, String)> rows;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Table(
      columnWidths: const {0: FixedColumnWidth(118), 1: FlexColumnWidth()},
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        for (final (k, v) in rows)
          TableRow(children: [
            Padding(padding: const EdgeInsets.only(bottom: 10, top: 2, right: 12), child: Text(k, style: text.bodySmall)),
            Padding(padding: const EdgeInsets.only(bottom: 10), child: Text(v.isEmpty ? '—' : v)),
          ]),
      ],
    );
  }
}

/// `.fld`: label above an input, 12 px bold muted label.
class Field extends StatelessWidget {
  const Field({super.key, required this.label, required this.child, this.hint});
  final String label;
  final Widget child;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: context.tokens.muted)),
        const SizedBox(height: 4),
        child,
        if (hint != null) Padding(padding: const EdgeInsets.only(top: 4), child: Text(hint!, style: text.bodySmall)),
      ],
    );
  }
}

/// `.fgrid`: two columns ≥ 560 px, one below.
class FormGrid extends StatelessWidget {
  const FormGrid({super.key, required this.children, this.gap = 12});
  final List<Widget> children;
  final double gap;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, c) {
          final cols = c.maxWidth >= 560 ? 2 : 1;
          final w = (c.maxWidth - gap * (cols - 1)) / cols;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [for (final ch in children) SizedBox(width: w, child: ch)],
          );
        },
      );
}

/// `.lr`: icon box · text · trailing, 10 px vertical padding.
class ListRow extends StatelessWidget {
  const ListRow({super.key, this.icon, required this.title, this.subtitle, this.trailing = const []});
  final IconData? icon;
  final String title;
  final String? subtitle;
  final List<Widget> trailing;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          if (icon != null) ...[IconBox(icon!), const SizedBox(width: 12)],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                if (subtitle != null) Text(subtitle!, style: text.bodySmall),
              ],
            ),
          ),
          ...trailing,
        ],
      ),
    );
  }
}

/// `.bar`: progress bar, 6 px (or custom height).
class ProgressBar extends StatelessWidget {
  const ProgressBar(this.fraction, {super.key, this.height = 6, this.color});
  final double fraction;
  final double height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: LinearProgressIndicator(
        value: fraction.clamp(0, 1),
        minHeight: height,
        backgroundColor: t.subtle,
        color: color ?? t.brand,
      ),
    );
  }
}

/// `.seg`: segmented control.
class Segmented<T> extends StatelessWidget {
  const Segmented({super.key, required this.options, required this.value, required this.onChanged});
  final List<(T, String)> options;
  final T value;
  final ValueChanged<T> onChanged;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: t.lineStrong), borderRadius: BorderRadius.circular(NjiaTokens.radiusSmall)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final (i, (v, label)) in options.indexed)
            Container(
              decoration: BoxDecoration(border: i > 0 ? Border(left: BorderSide(color: t.line)) : null),
              child: InkWell(
                onTap: () => onChanged(v),
                child: Container(
                  color: v == value ? t.brand : t.surface,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(label, style: TextStyle(fontSize: 12, fontWeight: v == value ? FontWeight.w600 : FontWeight.w400, color: v == value ? t.onBrand : t.ink)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Toast (prototype `.toast`): short status message at the bottom.
void toast(BuildContext context, String message) {
  ScaffoldMessenger.maybeOf(context)
    ?..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating, duration: const Duration(seconds: 3)));
}

/// `.row.between`: label left, control right.
class LabeledRow extends StatelessWidget {
  const LabeledRow({super.key, required this.label, required this.trailing});
  final String label;
  final Widget trailing;
  @override
  Widget build(BuildContext context) => Row(
        children: [Expanded(child: Text(label)), trailing],
      );
}

/// Builds a `DropdownButtonFormField` styled like `.selw`.
class SelectField<T> extends StatelessWidget {
  const SelectField({super.key, required this.label, required this.value, required this.items, required this.onChanged});
  final String label;
  final T? value;
  final List<(T, String)> items;
  final ValueChanged<T?> onChanged;
  @override
  Widget build(BuildContext context) => Field(
        label: label,
        child: DropdownButtonFormField<T>(
          initialValue: value,
          isExpanded: true,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          items: [for (final (v, l) in items) DropdownMenuItem(value: v, child: Text(l, overflow: TextOverflow.ellipsis))],
          onChanged: onChanged,
        ),
      );
}
