// First goal: three starter goals, the welcome dialog and the getting-started checklist.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/app/router.dart';
import 'package:njia_careers/app/shell.dart';
import 'package:njia_careers/features/goal/goal_constants.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/preview/sample_data.dart';

Future<ProviderContainer> pumpNewUser(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 1100);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final profile = sampleProfile.copyWith(activeGoalId: null, progress: null);
  await tester.pumpWidget(ProviderScope(overrides: previewOverrides(profile: profile, goals: const []), child: const NjiaApp()));
  await tester.pumpAndSettle();
  return ProviderScope.containerOf(tester.element(find.byType(AppShell)));
}

void main() {
  test('starter goals use three different countries and routes that exist in the seed', () {
    expect(starterGoals, hasLength(3));
    expect(starterGoals.map((s) => s.goal.countryId).toSet(), hasLength(3));
    expect(starterGoals.map((s) => s.route).toSet(), hasLength(3));
    expect(starterGoals.map((s) => s.goal.field).toSet(), hasLength(3), reason: 'three different fields');
    for (final s in starterGoals) {
      expect(s.goal.pathwayIds, isNotEmpty);
      expect(s.goal.occupationId, isNotNull);
      expect(RegExp(r'\d').hasMatch(s.pitch), isFalse, reason: 'no unsourced numbers in the copy');
    }
  });

  testWidgets('first goal: pick a starter, see the welcome, then the checklist', (tester) async {
    final c = await pumpNewUser(tester);
    c.read(routerProvider).go(Routes.goalNew);
    await tester.pumpAndSettle();
    expect(find.text('PICK A STARTING POINT'), findsOneWidget);
    expect(find.text('Start with this'), findsNWidgets(3));
    expect(find.text('AI engineer'), findsOneWidget);

    await tester.tap(find.text('Start with this').first);
    await tester.pumpAndSettle();
    final repo = c.read(userRepositoryProvider) as FakeUserRepository;
    final goals = repo.goalsOf(sampleUid);
    expect(goals, hasLength(1));
    expect(goals.single.title, 'AI engineer');
    expect(goals.single.countryId, 'FI');
    expect(goals.single.pathwayIds, ['fi-msc-ml-aalto']);
    expect(goals.single.targetYear, greaterThanOrEqualTo(DateTime.now().year + 5));

    expect(find.byKey(const Key('welcome-guide')), findsOneWidget);
    expect(find.text('Your roadmap is ready'), findsOneWidget);
    await tester.tap(find.text('Later'));
    await tester.pumpAndSettle();
    final guide = ((repo.profileOf(sampleUid)!.progress![goals.single.id] as Map)['guide'] as Map);
    expect(guide['welcomed'], true);
    expect(find.byKey(const Key('getting-started')), findsOneWidget);
    expect(find.text('Tell us about you'), findsOneWidget);

    await tester.tap(find.text('Hide'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('getting-started')), findsNothing);
  });

  testWidgets('"Start with step 1" leads through the steps with a Next button on each page', (tester) async {
    final c = await pumpNewUser(tester);
    c.read(routerProvider).go(Routes.goalNew);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Start with this').first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('welcome-start')));
    await tester.pumpAndSettle();
    final router = c.read(routerProvider);
    String path() => router.routeInformationProvider.value.uri.path;
    expect(path(), Routes.profile);
    expect(find.byKey(const Key('guide-bar')), findsOneWidget);
    expect(find.textContaining('Step 1 of 5'), findsOneWidget);

    await tester.tap(find.byKey(const Key('guide-next')));
    await tester.pumpAndSettle();
    expect(path(), Routes.documents);
    expect(find.textContaining('Step 2 of 5'), findsOneWidget);
    await tester.tap(find.byKey(const Key('guide-back')));
    await tester.pumpAndSettle();
    expect(path(), Routes.profile);

    router.go(Routes.jobs);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('guide-bar')), findsNothing, reason: 'only on the five step pages');
  });
}
