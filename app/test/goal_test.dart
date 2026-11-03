// Goal drawer and form with sample data: list, switch, validation, add, edit, delete.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/app/router.dart';
import 'package:njia_careers/app/shell.dart';
import 'package:njia_careers/features/goal/goal_constants.dart';
import 'package:njia_careers/features/goal/goal_drawer.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/preview/sample_data.dart';

Future<ProviderContainer> pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 1000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(overrides: previewOverrides(), child: const NjiaApp()));
  await tester.pumpAndSettle();
  return ProviderScope.containerOf(tester.element(find.byType(AppShell)));
}

/// Scrolls the drawer's list until [finder] is on screen (tester.ensureVisible does not reach into it).
Future<void> reveal(WidgetTester tester, Finder finder) async {
  final scrollable = find.descendant(of: find.byType(GoalDrawer), matching: find.byType(Scrollable)).first;
  await tester.scrollUntilVisible(finder, 200, scrollable: scrollable);
  await tester.pumpAndSettle();
}

Future<void> openDrawer(WidgetTester tester) async {
  await tester.tap(find.text('Goal 1 of 2'.toUpperCase()));
  await tester.pumpAndSettle();
}

void main() {
  test('earliest target year follows graduation and destination', () {
    final now = DateTime(2026, 11, 3);
    expect(earliestTargetYear(graduationYear: 2030, countryId: 'DE', now: now), 2033);
    expect(earliestTargetYear(graduationYear: 2030, countryId: 'SL', now: now), 2031);
    expect(earliestTargetYear(graduationYear: null, countryId: 'DE', now: now), 2029);
    expect(earliestTargetYear(graduationYear: 2020, countryId: 'DE', now: now), 2027);
  });

  testWidgets('drawer lists goals, shows the active one and "What you told us"', (tester) async {
    await pumpApp(tester);
    await openDrawer(tester);
    expect(find.text('Your goals'), findsOneWidget);
    expect(find.text('Head of Department · Deutsche Bank'), findsWidgets);
    expect(find.text('Data scientist · a fintech'), findsOneWidget);
    expect(find.text('Active'), findsOneWidget);
    expect(find.text('What you told us'), findsOneWidget);
    expect(find.text('€120,000 / year'), findsOneWidget);
    expect(find.text('Salary, Stability'), findsOneWidget);
  });

  testWidgets('switching the goal updates activeGoalId', (tester) async {
    final c = await pumpApp(tester);
    await openDrawer(tester);
    await tester.tap(find.text('Data scientist · a fintech'));
    await tester.pumpAndSettle();
    final repo = c.read(userRepositoryProvider) as FakeUserRepository;
    expect(repo.profileOf(sampleUid)!.activeGoalId, 'g2');
    expect(find.text('Goal 2 of 2'.toUpperCase()), findsOneWidget);
  });

  testWidgets('adding a goal validates, saves and makes it active', (tester) async {
    final c = await pumpApp(tester);
    await openDrawer(tester);
    await tester.tap(find.text('Add a goal'));
    await tester.pumpAndSettle();
    expect(find.text('Start from an example'.toUpperCase()), findsOneWidget);
    await reveal(tester, find.text('Add goal and open it'));
    await tester.tap(find.text('Add goal and open it'));
    await tester.pumpAndSettle();
    expect(find.text('Add your dream job.'), findsOneWidget);

    await reveal(tester, find.text('Civil engineer · Vienna'));
    await tester.tap(find.text('Civil engineer · Vienna'));
    await tester.pumpAndSettle();
    await reveal(tester, find.widgetWithText(TextField, '2037'));
    await tester.enterText(find.widgetWithText(TextField, '2037'), '2031'); // below earliest (2033)
    await reveal(tester, find.text('Add goal and open it'));
    await tester.tap(find.text('Add goal and open it'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('goal-error')), findsOneWidget);

    await reveal(tester, find.widgetWithText(TextField, '2031'));
    await tester.enterText(find.widgetWithText(TextField, '2031'), '2037');
    await reveal(tester, find.text('Add goal and open it'));
    await tester.tap(find.text('Add goal and open it'));
    await tester.pumpAndSettle();
    final repo = c.read(userRepositoryProvider) as FakeUserRepository;
    final goals = repo.goalsOf(sampleUid);
    expect(goals.length, 3);
    expect(goals.last.title, 'Civil engineer');
    expect(goals.last.countryId, 'AT');
    expect(goals.last.city, 'Vienna');
    expect(repo.profileOf(sampleUid)!.activeGoalId, goals.last.id);
    expect(find.text('Goal 3 of 3'.toUpperCase()), findsOneWidget);
  });

  testWidgets('deleting a goal asks for confirmation', (tester) async {
    final c = await pumpApp(tester);
    await openDrawer(tester);
    await tester.tap(find.byTooltip('Delete goal').last);
    await tester.pumpAndSettle();
    expect(find.text('Keep'), findsOneWidget);
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    final repo = c.read(userRepositoryProvider) as FakeUserRepository;
    expect(repo.goalsOf(sampleUid).map((g) => g.id), ['g1']);
  });

  testWidgets('/goal/new renders the full-page form', (tester) async {
    await pumpApp(tester);
    final router = ProviderScope.containerOf(tester.element(find.byType(AppShell))).read(routerProvider);
    router.go('/goal/new');
    await tester.pumpAndSettle();
    expect(find.text('Add a goal'), findsWidgets);
    expect(find.text('Dream job'), findsOneWidget);
  });
}
