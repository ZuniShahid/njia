// Global shell, minimal version of the prototype layout: left nav (> 860 px) or bottom nav + "More"
// sheet (≤ 860 px). The right panel / three-column layout at ≥ 1181 px is task 6 (docs/handover.md).
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';
import 'theme.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.location, required this.child});

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth <= NjiaTokens.narrow;
        if (narrow) {
          return Scaffold(
            body: SafeArea(child: child),
            bottomNavigationBar: _BottomNav(location: location),
          );
        }
        return Scaffold(
          body: Row(
            children: [
              _LeftNav(location: location),
              Expanded(child: SafeArea(child: child)),
            ],
          ),
        );
      },
    );
  }
}

class _LeftNav extends StatelessWidget {
  const _LeftNav({required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      width: 240,
      color: t.nav,
      padding: const EdgeInsets.fromLTRB(12, 20, 12, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
            child: Row(
              children: [
                const NjiaMark(),
                const SizedBox(width: 10),
                Text('Njia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: t.navInk)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (final item in navItems) ...[
                  if (item.group != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 6),
                      child: Text(item.group!.toUpperCase(),
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.77, color: t.navMuted)),
                    ),
                  _NavLink(item: item, selected: location == item.route),
                ],
              ],
            ),
          ),
          _NavLink(
            item: const NavItem(Routes.profile, 'Profile', Icons.person_outline_rounded),
            selected: location == Routes.profile,
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.item, required this.selected});
  final NavItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Material(
      color: selected ? t.nav2 : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => context.go(item.route),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              Icon(item.icon, size: 18, color: selected ? t.accent : t.navMuted),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    color: selected ? t.navInk : t.navMuted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    final items = bottomNavRoutes.map((r) => navItems.firstWhere((n) => n.route == r)).toList();
    final index = items.indexWhere((n) => n.route == location);
    return NavigationBar(
      selectedIndex: index < 0 ? items.length : index,
      onDestinationSelected: (i) {
        if (i < items.length) {
          context.go(items[i].route);
        } else {
          _showMore(context);
        }
      },
      destinations: [
        for (final n in items) NavigationDestination(icon: Icon(n.icon), label: n.label == 'Next milestone' ? 'Milestone' : n.label),
        const NavigationDestination(icon: Icon(Icons.more_horiz_rounded), label: 'More'),
      ],
    );
  }

  void _showMore(BuildContext context) {
    final rest = [
      ...navItems.where((n) => !bottomNavRoutes.contains(n.route)),
      const NavItem(Routes.profile, 'Profile', Icons.person_outline_rounded),
    ];
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheet) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (final n in rest)
              ListTile(
                leading: Icon(n.icon),
                title: Text(n.label),
                onTap: () {
                  Navigator.of(sheet).pop();
                  context.go(n.route);
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// The "N" mark from the prototype logo.
class NjiaMark extends StatelessWidget {
  const NjiaMark({super.key, this.size = 30});
  final double size;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: t.accent, borderRadius: BorderRadius.circular(8)),
      child: Text('N', style: TextStyle(fontWeight: FontWeight.w800, fontSize: size * 0.5, color: const Color(0xFF13211F))),
    );
  }
}
