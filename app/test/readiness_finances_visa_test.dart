// Widget tests for Readiness, Finances and Visa & residence with sample data.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/app/router.dart';
import 'package:njia_careers/app/shell.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/preview/sample_data.dart';
import 'package:njia_careers/shared/widgets/provenance_chip.dart';
import 'package:njia_careers/shared/widgets/view_scaffold.dart';

Future<ProviderContainer> pumpAt(WidgetTester tester, String route, {Size size = const Size(1400, 1100)}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(overrides: previewOverrides(), child: const NjiaApp()));
  await tester.pumpAndSettle();
  final c = ProviderScope.containerOf(tester.element(find.byType(AppShell)));
  c.read(routerProvider).go(route);
  await tester.pumpAndSettle();
  return c;
}

Future<void> scrollTo(WidgetTester tester, Finder f) async {
  final center = find.descendant(of: find.byType(ViewScaffold), matching: find.byType(Scrollable)).first;
  await tester.scrollUntilVisible(f, 250, scrollable: center, maxScrolls: 60);
  await tester.pumpAndSettle();
}

void main() {
  group('Readiness', () {
    testWidgets('shows overall score, dimensions with provenance and levers', (tester) async {
      final c = await pumpAt(tester, Routes.readiness);
      final m = c.read(readinessProvider).value!;
      expect(find.textContaining('${m.overall} / 100', findRichText: true), findsOneWidget);
      expect(find.text('Education'), findsWidgets);
      expect(find.text('Languages'), findsWidgets);
      expect(find.text('Biggest levers'), findsOneWidget);
      expect(find.text('By area'), findsOneWidget);
      expect(find.byType(ProvenanceChip), findsWidgets);
    });

    testWidgets('ticking a requirement writes the fact, recomputes and asks the server', (tester) async {
      final c = await pumpAt(tester, Routes.readiness);
      final before = c.read(readinessProvider).value!.overall;
      final tick = find.byKey(const ValueKey('tick-gmat-or-gre'));
      await scrollTo(tester, tick);
      await tester.tap(tick);
      await tester.pumpAndSettle();
      final repo = c.read(userRepositoryProvider) as FakeUserRepository;
      expect(repo.profileOf(sampleUid)!.facts!['exams.gmat'], true);
      expect((c.read(planServiceProvider) as FakePlanService).calls, 1);
      expect(c.read(readinessProvider).value!.overall, greaterThan(before));
    });
  });

  group('Finances', () {
    testWidgets('overview: tiles, chart, cost table with provenance, your money', (tester) async {
      await pumpAt(tester, Routes.finances);
      expect(find.text('Total cost'), findsOneWidget);
      expect(find.text('Funding gap'), findsWidgets);
      expect(find.text('Costs vs. funds per year'), findsOneWidget);
      await scrollTo(tester, find.text('Costs by step'));
      expect(find.byType(ProvenanceChip), findsWidgets);
      await scrollTo(tester, find.text('Your money'));
      expect(find.text('Savings'), findsOneWidget);
    });

    testWidgets('adding a money source stores it in the goal progress', (tester) async {
      final c = await pumpAt(tester, Routes.finances);
      await scrollTo(tester, find.text('Add money source'));
      await tester.enterText(find.widgetWithText(TextField, 'e.g. Uncle in London'), 'Uncle in London');
      await tester.enterText(find.widgetWithText(TextField, '1000'), '1500');
      await tester.tap(find.text('Add money source'));
      await tester.pumpAndSettle();
      final repo = c.read(userRepositoryProvider) as FakeUserRepository;
      final money = (repo.profileOf(sampleUid)!.progress!['g1'] as Map)['money'] as List;
      expect(money.length, 1);
      expect((money.first as Map)['perYear'], 1500);
      expect(find.text('Uncle in London'), findsOneWidget);
    });

    testWidgets('finance it: phases, savings planner with blocked account target', (tester) async {
      await pumpAt(tester, Routes.finances);
      await tester.tap(find.text('Finance it'));
      await tester.pumpAndSettle();
      expect(find.text('How you pay for each phase'), findsOneWidget);
      await scrollTo(tester, find.text('Savings planner'));
      expect(find.textContaining('Blocked account'), findsWidgets);
      expect(find.text('11904'), findsOneWidget);
      expect(find.text('All funding options'), findsOneWidget);
    });

    testWidgets('scholarships: list from content, add to plan', (tester) async {
      final c = await pumpAt(tester, Routes.finances);
      await tester.tap(find.text('Scholarships'));
      await tester.pumpAndSettle();
      expect(find.textContaining('funding options ·'), findsOneWidget);
      await scrollTo(tester, find.text('DAAD EPOS – Development-Related Postgraduate Courses'));
      await tester.tap(find.text('DAAD EPOS – Development-Related Postgraduate Courses'));
      await tester.pumpAndSettle();
      expect(find.text('WHO CAN APPLY'), findsOneWidget);
      await scrollTo(tester, find.text('Add to my funding plan'));
      await tester.tap(find.text('Add to my funding plan'));
      await tester.pumpAndSettle();
      final repo = c.read(userRepositoryProvider) as FakeUserRepository;
      expect(((repo.profileOf(sampleUid)!.progress!['g1'] as Map)['funding'] as Map)['daad-epos'], true);
      expect(find.text('Remove from plan'), findsOneWidget);
    });
  });

  group('Visa & residence', () {
    testWidgets('shows Germany student visa facts with provenance and requirements', (tester) async {
      await pumpAt(tester, Routes.visa);
      expect(find.text('Visa & residence'), findsWidgets);
      expect(find.text('Student visa'), findsWidgets);
      expect(find.text('German Embassy Accra'), findsWidgets);
      expect(find.text('€75'), findsWidgets);
      expect(find.text('€11,904'), findsWidgets);
      expect(find.byType(ProvenanceChip), findsWidgets);
      expect(find.text('Apply in Accra, not Freetown'), findsOneWidget);
      await scrollTo(tester, find.text('Requirements'));
      expect(find.text('Application checklist'), findsOneWidget);
      expect(find.text('Cost to apply'), findsOneWidget);
    });

    testWidgets('tapping a status mark cycles and persists it', (tester) async {
      final c = await pumpAt(tester, Routes.visa);
      await scrollTo(tester, find.text('Requirements'));
      final mark = find.byKey(const ValueKey('visa-DE-student|passport-valid'));
      await scrollTo(tester, mark);
      await tester.tap(mark);
      await tester.pumpAndSettle();
      final repo = c.read(userRepositoryProvider) as FakeUserRepository;
      final visa = (repo.profileOf(sampleUid)!.progress!['g1'] as Map)['visa'] as Map;
      expect(visa.values.first, isIn([1, 2]));
    });

    testWidgets('switching the destination loads that country', (tester) async {
      await pumpAt(tester, Routes.visa);
      await tester.tap(find.text('Germany'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Hungary').last);
      await tester.pumpAndSettle();
      expect(find.text('HU-student'), findsNothing);
      expect(find.textContaining('Hungary'), findsWidgets);
      expect(find.text('Student visa'), findsWidgets);
    });
  });
}
