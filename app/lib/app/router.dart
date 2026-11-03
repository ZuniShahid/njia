// go_router routes – one per prototype view (docs/prototype-notes.md) plus auth and admin.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/admin/admin_changes_view.dart';
import '../features/auth/auth_view.dart';
import '../features/big_picture/big_picture_view.dart';
import '../features/coach/coach_view.dart';
import '../features/cockpit/cockpit_view.dart';
import '../features/documents/documents_view.dart';
import '../features/finances/finances_view.dart';
import '../features/goal/goal_view.dart';
import '../features/jobs/jobs_view.dart';
import '../features/milestone/milestone_view.dart';
import '../features/profile/profile_view.dart';
import '../features/readiness/readiness_view.dart';
import '../features/roadmap/roadmap_view.dart';
import '../features/visa/visa_view.dart';
import 'providers.dart';
import 'shell.dart';

abstract final class Routes {
  static const auth = '/auth';
  static const cockpit = '/';
  static const milestone = '/milestone';
  static const map = '/map';
  static const roadmap = '/roadmap';
  static const readiness = '/readiness';
  static const finances = '/finances';
  static const visa = '/visa';
  static const jobs = '/jobs';
  static const coach = '/coach';
  static const documents = '/documents';
  static const profile = '/profile';
  static const adminChanges = '/admin/changes';
  static String goal(String id) => '/goal/$id';
  static const goalNew = '/goal/new';
}

/// Navigation entries in prototype order (left nav groups / bottom nav).
class NavItem {
  const NavItem(this.route, this.label, this.icon, {this.group});
  final String route;
  final String label;
  final IconData icon;
  final String? group;
}

const navItems = <NavItem>[
  NavItem(Routes.cockpit, 'Cockpit', Icons.grid_view_rounded, group: 'Your goal'),
  NavItem(Routes.milestone, 'Next milestone', Icons.flag_outlined),
  NavItem(Routes.map, 'Big picture', Icons.public_rounded),
  NavItem(Routes.roadmap, 'Roadmap', Icons.view_timeline_outlined, group: 'Your path'),
  NavItem(Routes.readiness, 'Readiness', Icons.track_changes_rounded),
  NavItem(Routes.finances, 'Finances', Icons.account_balance_wallet_outlined),
  NavItem(Routes.visa, 'Visa & residence', Icons.badge_outlined, group: 'Go global'),
  NavItem(Routes.jobs, 'Jobs', Icons.work_outline_rounded),
  NavItem(Routes.coach, 'Coach', Icons.menu_book_outlined, group: 'Support'),
  NavItem(Routes.documents, 'Documents', Icons.description_outlined),
];

/// Bottom nav on narrow screens (prototype `.bnav`): Cockpit · Roadmap · Milestone · Jobs · More.
const bottomNavRoutes = [Routes.cockpit, Routes.roadmap, Routes.milestone, Routes.jobs];

final routerProvider = Provider<GoRouter>((ref) {
  final signedIn = ValueNotifier<bool?>(ref.read(isSignedInProvider));
  ref.listen<bool?>(isSignedInProvider, (_, next) => signedIn.value = next);
  ref.onDispose(signedIn.dispose);

  return GoRouter(
    initialLocation: Routes.cockpit,
    refreshListenable: signedIn,
    redirect: (context, state) {
      final s = signedIn.value;
      if (s == null) return null; // auth state still loading
      final atAuth = state.matchedLocation == Routes.auth;
      if (!s && !atAuth) return Routes.auth;
      if (s && atAuth) return Routes.cockpit;
      return null;
    },
    routes: [
      GoRoute(path: Routes.auth, builder: (_, _) => const AuthView()),
      ShellRoute(
        builder: (context, state, child) => AppShell(location: state.matchedLocation, child: child),
        routes: [
          GoRoute(path: Routes.cockpit, builder: (_, _) => const CockpitView()),
          GoRoute(path: Routes.milestone, builder: (_, _) => const MilestoneView()),
          GoRoute(path: Routes.map, builder: (_, _) => const BigPictureView()),
          GoRoute(path: Routes.roadmap, builder: (_, _) => const RoadmapView()),
          GoRoute(path: Routes.readiness, builder: (_, _) => const ReadinessView()),
          GoRoute(path: Routes.finances, builder: (_, _) => const FinancesView()),
          GoRoute(path: Routes.visa, builder: (_, _) => const VisaView()),
          GoRoute(path: Routes.jobs, builder: (_, _) => const JobsView()),
          GoRoute(path: Routes.coach, builder: (_, _) => const CoachView()),
          GoRoute(path: Routes.documents, builder: (_, _) => const DocumentsView()),
          GoRoute(path: Routes.profile, builder: (_, _) => const ProfileView()),
          GoRoute(path: '/goal/:id', builder: (_, state) => GoalView(goalId: state.pathParameters['id']!)),
          GoRoute(path: Routes.adminChanges, builder: (_, _) => const AdminChangesView()),
        ],
      ),
    ],
  );
});
