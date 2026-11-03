// Global shell, ported from the prototype: left nav with goal switcher, nav groups and user card
// (> 860 px); top bar with job search and account menu; bottom nav + "More" sheet (≤ 860 px).
// The right panel / three-column layout at ≥ 1181 px is handled per view (ViewScaffold) – task 6.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/goal/goal_drawer.dart';
import '../features/goal/goal_title.dart';
import '../shared/widgets/ui.dart';
import 'providers.dart';
import 'router.dart';
import 'theme.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.location, required this.child});

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth <= NjiaTokens.narrow;
        if (narrow) {
          return Scaffold(
            body: SafeArea(child: Column(children: [const _TopBar(narrow: true), Expanded(child: child)])),
            bottomNavigationBar: _BottomNav(location: location),
          );
        }
        return Scaffold(
          body: Row(
            children: [
              _LeftNav(location: location),
              Expanded(child: SafeArea(child: Column(children: [const _TopBar(narrow: false), Expanded(child: child)]))),
            ],
          ),
        );
      },
    );
  }
}

class _TopBar extends ConsumerWidget {
  const _TopBar({required this.narrow});
  final bool narrow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final profile = ref.watch(profileProvider).value;
    final goal = ref.watch(activeGoalProvider);
    final name = profile?.displayName ?? '';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: narrow ? 16 : 32, vertical: 12),
      decoration: BoxDecoration(color: t.bg, border: Border(bottom: BorderSide(color: t.line))),
      child: Row(
        children: [
          if (narrow) ...[
            const NjiaMark(),
            const SizedBox(width: 10),
            Flexible(
              child: OutlinedButton(
                onPressed: () => showGoalDrawer(context),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  side: BorderSide(color: t.line),
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                child: Text(goal?.title ?? 'Add a goal', overflow: TextOverflow.ellipsis),
              ),
            ),
          ] else
            SizedBox(
              width: 340,
              child: TextField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.search_rounded, size: 18), hintText: 'Search jobs… (Enter)', isDense: true),
                textInputAction: TextInputAction.search,
                onSubmitted: (q) => context.go(Uri(path: Routes.jobs, queryParameters: q.trim().isEmpty ? null : {'q': q.trim()}).toString()),
              ),
            ),
          const Spacer(),
          MenuAnchor(
            builder: (context, controller, _) => InkWell(
              borderRadius: BorderRadius.circular(99),
              onTap: () => controller.isOpen ? controller.close() : controller.open(),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Row(mainAxisSize: MainAxisSize.min, children: [Avatar(name.isEmpty ? '?' : name, size: 36), Icon(Icons.expand_more_rounded, size: 16, color: t.muted)]),
              ),
            ),
            menuChildren: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text(profile?.email ?? '', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              MenuItemButton(leadingIcon: const Icon(Icons.person_outline_rounded, size: 18), onPressed: () => context.go(Routes.profile), child: const Text('Profile & settings')),
              MenuItemButton(
                leadingIcon: const Icon(Icons.track_changes_rounded, size: 18),
                onPressed: () => showGoalDrawer(context),
                child: Text('Your goals (${ref.watch(goalsProvider).value?.length ?? 0}/$maxGoals)'),
              ),
              MenuItemButton(leadingIcon: const Icon(Icons.logout_rounded, size: 18), onPressed: () => ref.read(authServiceProvider).signOut(), child: const Text('Sign out')),
            ],
          ),
        ],
      ),
    );
  }
}

class _LeftNav extends ConsumerWidget {
  const _LeftNav({required this.location});
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final goals = ref.watch(goalsProvider).value ?? const [];
    final goal = ref.watch(activeGoalProvider);
    final profile = ref.watch(profileProvider).value;
    final name = profile?.displayName ?? '';
    final index = goal == null ? 0 : goals.indexWhere((g) => g.id == goal.id) + 1;
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
          // goal switcher (prototype .goal-sw)
          Material(
            color: t.nav2,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => showGoalDrawer(context, mode: goals.isEmpty ? GoalDrawerMode.create : GoalDrawerMode.list),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OverLabel(goals.isEmpty ? 'No goal yet' : 'Goal $index of ${goals.length}', color: t.navMuted),
                          Text(goal == null ? 'Add your first goal' : goalTitle(goal),
                              maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.navInk, height: 1.35)),
                        ],
                      ),
                    ),
                    Icon(Icons.unfold_more_rounded, size: 16, color: t.navMuted),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (final item in navItems) ...[
                  if (item.group != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 6),
                      child: Text(item.group!.toUpperCase(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.77, color: t.navMuted)),
                    ),
                  _NavLink(item: item, selected: location == item.route),
                ],
              ],
            ),
          ),
          // user card (prototype .user)
          Material(
            color: location == Routes.profile ? t.nav2 : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => context.go(Routes.profile),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Avatar(name.isEmpty ? '?' : name),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name.isEmpty ? 'Your profile' : name, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.navInk)),
                          Text('Student · Sierra Leone', style: TextStyle(fontSize: 12, color: t.navMuted)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                  style: TextStyle(fontSize: 14, fontWeight: selected ? FontWeight.w600 : FontWeight.w400, color: selected ? t.navInk : t.navMuted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNav extends ConsumerWidget {
  const _BottomNav({required this.location});
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = bottomNavRoutes.map((r) => navItems.firstWhere((n) => n.route == r)).toList();
    final index = items.indexWhere((n) => n.route == location);
    return NavigationBar(
      selectedIndex: index < 0 ? items.length : index,
      onDestinationSelected: (i) {
        if (i < items.length) {
          context.go(items[i].route);
        } else {
          _showMore(context, ref.read(goalsProvider).value?.length ?? 0);
        }
      },
      destinations: [
        for (final n in items) NavigationDestination(icon: Icon(n.icon), label: n.label == 'Next milestone' ? 'Milestone' : n.label),
        const NavigationDestination(icon: Icon(Icons.more_horiz_rounded), label: 'More'),
      ],
    );
  }

  void _showMore(BuildContext context, int goalCount) {
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(sheet).pop();
                  showGoalDrawer(context);
                },
                icon: const Icon(Icons.track_changes_rounded, size: 14),
                label: Text('Your goals ($goalCount/$maxGoals)'),
              ),
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
