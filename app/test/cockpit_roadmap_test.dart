// Cockpit and Roadmap widgets with sample data; the plan is computed by the Dart engine from the
// seed content (no server plan in the preview fakes).
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/app/router.dart';
import 'package:njia_careers/app/shell.dart';
import 'package:njia_careers/core/engine/roadmap_model.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/preview/sample_data.dart';
import 'package:njia_careers/shared/widgets/provenance_chip.dart';
import 'package:njia_careers/shared/widgets/ui.dart';
import 'package:njia_careers/shared/widgets/view_scaffold.dart';

Future<ProviderContainer> pumpApp(WidgetTester tester, {Size size = const Size(1400, 1000)}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(overrides: previewOverrides(), child: const NjiaApp()));
  await tester.pumpAndSettle();
  return ProviderScope.containerOf(tester.element(find.byType(AppShell)));
}

/// Scrolls the center column (the second vertical list after the nav) until [f] is built and visible.
Future<void> scrollTo(WidgetTester tester, Finder f, {bool up = false}) async {
  // the center column is the first Scrollable inside ViewScaffold (the nav list and the search field come before it in the tree)
  final center = find.descendant(of: find.byType(ViewScaffold), matching: find.byType(Scrollable)).first;
  await tester.scrollUntilVisible(f, up ? -250 : 250, scrollable: center, maxScrolls: 60);
  await tester.pumpAndSettle();
}

RoadmapModel modelOf(ProviderContainer c) => c.read(roadmapProvider).value!;

void main() {
  testWidgets('cockpit shows hero, metrics, milestone, tasks, chances and deadlines', (tester) async {
    final c = await pumpApp(tester);
    final m = modelOf(c);
    expect(find.textContaining('Good '), findsOneWidget);
    expect(find.text('Head of Department · Deutsche Bank'), findsWidgets);
    expect(find.text('Frankfurt, Germany · target 2042'), findsOneWidget);
    expect(find.text('0 / ${m.stepsTotal}'), findsOneWidget);
    expect(find.text('${m.plan.scores.readiness}'), findsWidgets);
    expect(find.text('NEXT MILESTONE'), findsOneWidget);
    expect(find.text('Prepare'), findsWidgets);
    expect(find.text('This week'), findsOneWidget);
    expect(find.text('Your chances'), findsOneWidget);
    expect(find.text('FEASIBILITY'), findsOneWidget);
    expect(find.text('Next best action'), findsOneWidget);
    expect(find.text('Upcoming deadlines'), findsOneWidget);
  });

  testWidgets('ticking a task marks the step done and updates the counters', (tester) async {
    final c = await pumpApp(tester);
    final total = modelOf(c).stepsTotal;
    await scrollTo(tester, find.text('This week'));
    await tester.tap(find.bySemanticsLabel('Mark done').first);
    await tester.pumpAndSettle();
    final repo = c.read(userRepositoryProvider) as FakeUserRepository;
    final progress = repo.profileOf(sampleUid)!.progress!['g1'] as Map;
    expect((progress['steps'] as Map).values.first, 2);
    await scrollTo(tester, find.text('steps done'), up: true);
    expect(find.text('1 / $total'), findsOneWidget);
  });

  testWidgets('roadmap lists phases and steps, opens a step with provenance chips', (tester) async {
    final c = await pumpApp(tester);
    c.read(routerProvider).go(Routes.roadmap);
    await tester.pumpAndSettle();
    expect(find.text('Roadmap'), findsWidgets);
    expect(find.text('Prepare · Freetown'), findsOneWidget);
    expect(find.textContaining('Move to Germany'), findsWidgets);

    // open the Frankfurt School study step → tuition with provenance
    await scrollTo(tester, find.text('Master of Finance').first);
    await tester.tap(find.text('Master of Finance').first);
    await tester.pumpAndSettle();
    expect(find.text('TARGET'), findsOneWidget);
    expect(find.text('€42,000'), findsWidgets);
    expect(find.byType(ProvenanceChip), findsWidgets);
    expect(find.text('DONE WHEN'), findsOneWidget);
    expect(find.text('Ask coach'), findsOneWidget);

    await scrollTo(tester, find.text('Decision points'));
    expect(find.text('Which funding first?'), findsOneWidget);
    expect(find.text('Watch out'), findsOneWidget);
    expect(find.text('Visa appointment abroad'), findsOneWidget);
  });

  testWidgets('roadmap step status is saved per goal', (tester) async {
    final c = await pumpApp(tester);
    final first = modelOf(c).steps.first;
    c.read(routerProvider).go('${Routes.roadmap}?step=${Uri.encodeComponent(first.key)}');
    await tester.pumpAndSettle();
    expect(find.text('Step status'), findsOneWidget);
    await tester.tap(find.descendant(of: find.byType(Segmented<int>), matching: find.text('Done')));
    await tester.pumpAndSettle();
    final repo = c.read(userRepositoryProvider) as FakeUserRepository;
    final progress = repo.profileOf(sampleUid)!.progress!['g1'] as Map;
    expect((progress['steps'] as Map)[first.key], 2);
  });

  testWidgets('deep link ?step= opens the visa step with fee and proof of funds', (tester) async {
    final c = await pumpApp(tester);
    c.read(routerProvider).go('${Routes.roadmap}?step=${Uri.encodeComponent('visa:DE-student')}');
    await tester.pumpAndSettle();
    await scrollTo(tester, find.text('Visa fee: '));
    expect(find.text('Proof of funds: '), findsOneWidget);
    expect(find.textContaining('Accra'), findsWidgets);
  });
}
