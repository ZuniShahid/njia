// Widget tests for Next milestone, Big picture, Jobs, Coach and Documents with sample data.
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/app/router.dart';
import 'package:njia_careers/app/shell.dart';
import 'package:njia_careers/core/engine/engine.dart';
import 'package:njia_careers/core/engine/milestone_model.dart';
import 'package:njia_careers/core/engine/roadmap_model.dart';
import 'package:njia_careers/core/models/models.dart';
import 'package:njia_careers/features/coach/coach_view.dart';
import 'package:njia_careers/features/documents/documents_view.dart';
import 'package:njia_careers/features/jobs/jobs_view.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/preview/sample_data.dart';
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

Directory repoRoot() {
  var dir = Directory.current;
  while (!Directory('${dir.path}/seed').existsSync()) {
    dir = dir.parent;
  }
  return dir;
}

void main() {
  group('MilestoneModel', () {
    final root = repoRoot().path;
    List<dynamic> load(String c) => jsonDecode(File('$root/seed/$c.json').readAsStringSync()) as List<dynamic>;
    final content = ContentBundle.fromJsonLists({for (final c in ['countries', 'corridors', 'pathways', 'requirements', 'residencePermits', 'funding', 'occupations']) c: load(c)});
    final goal = sampleGoals.first;
    final plan = buildPlan(goal: goal, profile: sampleProfile.copyWith(facts: factsFromProfile(sampleProfile)), content: content, now: DateTime.utc(2026, 11, 2));
    final rm = RoadmapModel.build(goal: goal, plan: plan, content: content, now: DateTime.utc(2026, 11, 2));
    test('groups the prepare phase by area and the move phase by admission/visa with checklist items', () {
      final m = MilestoneModel.build(rm);
      expect(m.title, 'Prepare');
      expect(m.groups.map((g) => g.name), containsAll(['Education', 'Language', 'Money']));
      expect(m.total, rm.phases.first.steps.length);
      final move = MilestoneModel.build(rm, phase: rm.phases[1]);
      expect(move.groups.map((g) => g.name), containsAll(['Admission', 'Visa']));
      final visa = move.groups.firstWhere((g) => g.name == 'Visa');
      expect(visa.items.where((i) => i.section == 'checks').length, greaterThan(3)); // permit checklist entries
      expect(move.items.any((i) => i.title.startsWith('Apply: ') && i.section == 'checks'), isTrue); // funding options
    });
  });

  group('Next milestone', () {
    testWidgets('renders groups, ticks an item and saves it', (tester) async {
      final c = await pumpAt(tester, Routes.milestone);
      expect(find.text('Prepare'), findsWidgets);
      expect(find.text('Help & tutoring'), findsOneWidget);
      final rm = c.read(roadmapProvider).value!;
      final key = MilestoneModel.build(rm).groups.firstWhere((g) => g.items.any((i) => !i.done)).items.first.key; // the auto-opened group
      final tick = find.byKey(ValueKey('ms-$key'));
      await scrollTo(tester, tick);
      await tester.tap(tick);
      await tester.pumpAndSettle();
      final repo = c.read(userRepositoryProvider) as FakeUserRepository;
      expect(((repo.profileOf(sampleUid)!.progress!['g1'] as Map)['steps'] as Map)[key], 2);
    });

    testWidgets('milestone selector switches the phase', (tester) async {
      await pumpAt(tester, Routes.milestone);
      await tester.tap(find.byType(DropdownButtonFormField<int>));
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining('Move to Germany').last);
      await tester.pumpAndSettle();
      expect(find.text('Visa'), findsWidgets);
      expect(find.text('Admission'), findsOneWidget);
    });
  });

  group('Big picture', () {
    // the map floats continuously (no reduced-motion in tests), so pump fixed durations instead of settling
    Future<void> pumpMap(WidgetTester tester) async {
      tester.view.physicalSize = const Size(1400, 1100);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(ProviderScope(overrides: previewOverrides(), child: const NjiaApp()));
      await tester.pumpAndSettle();
      ProviderScope.containerOf(tester.element(find.byType(AppShell))).read(routerProvider).go(Routes.map);
      for (var i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 250));
      }
    }

    testWidgets('shows nine pools with real statuses; tapping one opens its detail', (tester) async {
      await pumpMap(tester);
      expect(find.text('Big picture'), findsWidgets);
      for (final n in ['You', 'Pathways', 'Requirements', 'Recognition', 'Visa', 'Money', 'Jobs & pay', 'Helpers', 'Trust']) {
        expect(find.text(n), findsWidgets, reason: n);
      }
      expect(find.text('Start here'), findsOneWidget);
      await tester.tap(find.text('Money').first);
      await tester.pump(const Duration(milliseconds: 400));
      expect(find.text('CAN I PAY FOR IT?'), findsOneWidget);
      expect(find.textContaining('% of costs covered'), findsWidgets);
      expect(find.text('Depends on'.toUpperCase()), findsOneWidget);
    });

    testWidgets('order of work layout numbers the five main pools', (tester) async {
      await pumpMap(tester);
      await tester.tap(find.text('Order of work'));
      await tester.pump(const Duration(milliseconds: 400));
      expect(find.text('1'), findsWidgets);
      expect(find.text('5'), findsWidgets);
    });
  });

  group('Jobs', () {
    test('match score rewards occupation, language and sponsorship', () {
      final j = sampleJobs[1]; // Junior Credit Analyst, en, sponsorship yes
      final m = jobMatch(j, goal: sampleGoals.first, profile: sampleProfile);
      expect(m.score, greaterThanOrEqualTo(70));
      expect(m.have, contains('Visa sponsorship offered'));
      final dev = jobMatch(sampleJobs[5], goal: sampleGoals.first, profile: sampleProfile);
      expect(dev.gaps, contains('Different occupation than your goal'));
      expect(dev.score, lessThan(m.score));
    });

    testWidgets('lists postings, filters by roadmap, saves one', (tester) async {
      final c = await pumpAt(tester, Routes.jobs);
      expect(find.textContaining('jobs match'), findsOneWidget);
      expect(find.text('Graduate Trainee, Corporate Banking'), findsOneWidget);
      await tester.tap(find.text('Graduate Trainee, Corporate Banking'));
      await tester.pumpAndSettle();
      expect(find.text('YOU HAVE'), findsOneWidget);
      expect(find.textContaining('via preview-sample'), findsOneWidget);
      await scrollTo(tester, find.text('Save job'));
      await tester.tap(find.text('Save job'));
      await tester.pumpAndSettle();
      final repo = c.read(userRepositoryProvider) as FakeUserRepository;
      expect(((repo.profileOf(sampleUid)!.progress!['g1'] as Map)['savedJobs'] as Map)['preview-1'], true);
      expect(find.text('Saved ✓'), findsOneWidget);
    });
  });

  group('Coach', () {
    test('checkDraft flags stock phrases, length and missing numbers', () {
      final fb = checkDraft('I have always loved numbers. I want to study abroad.');
      expect(fb.where((f) => !f.$1).length, 4);
      final good = checkDraft('During my internship at a Freetown bank in 2025, I saw 40 small firms get credit. Watching one of them double its staff changed how I think about finance, and that is the work I want to do. ${'Each loan taught me something new about risk. ' * 3}');
      expect(good.where((f) => f.$1).length, greaterThanOrEqualTo(3));
    });

    testWidgets('path coach: topic chips, suggestions, honest reply from the service', (tester) async {
      await pumpAt(tester, Routes.coach);
      expect(find.text('Path coach'), findsOneWidget);
      expect(find.text('Whole plan'), findsWidgets);
      expect(find.text('Is my target year realistic?'), findsOneWidget);
      await tester.tap(find.text('Is my target year realistic?'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Preview answer'), findsOneWidget);
      await tester.enterText(find.widgetWithText(TextField, 'Ask about Whole plan…'), 'Please write my motivation letter for me');
      await tester.tap(find.text('Send'));
      await tester.pumpAndSettle();
      expect(find.textContaining("I won't write it for you"), findsOneWidget);
    });

    testWidgets('study coach: modes, draft check and transparency log', (tester) async {
      await pumpAt(tester, Routes.coach);
      await tester.tap(find.text('Study coach'));
      await tester.pumpAndSettle();
      expect(find.text('Quiz me'), findsOneWidget);
      await tester.enterText(find.widgetWithText(TextField, 'Your opening paragraph…'), 'I have always loved numbers. I want to work in banking.');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Check paragraph'));
      await tester.pumpAndSettle();
      expect(find.textContaining('stock phrase'), findsOneWidget);
      expect(find.text('Text written by the coach'), findsOneWidget);
      expect(find.text('0'), findsWidgets);
    });
  });

  group('Documents', () {
    test('rows merge route needs with uploaded files', () {
      final rows = buildDocRows(docs: sampleDocuments, goal: null, content: null);
      expect(rows.length, 3);
      expect(rows.firstWhere((r) => r.type == 'passport').state, DocState.checked);
      expect(categoryOf('ielts_certificate'), UserDocumentCategory.language);
      expect(categoryOf('blocked_account_confirmation'), UserDocumentCategory.finance);
    });

    testWidgets('lists needed documents with statuses and uploads one', (tester) async {
      final c = await pumpAt(tester, Routes.documents);
      expect(find.text('Documents'), findsWidgets);
      expect(find.text('Missing'), findsWidgets);
      expect(find.text('Passport'), findsWidgets);
      expect(find.text('Ielts certificate'), findsWidgets);
      await tester.tap(find.text('Ielts certificate').first);
      await tester.pumpAndSettle();
      expect(find.text('Upload Ielts certificate'), findsWidgets);
      final repo = c.read(documentsRepositoryProvider) as FakeDocumentsRepository;
      await repo.upload(sampleUid, type: 'ielts_certificate', category: UserDocumentCategory.language, fileName: 'ielts.pdf', bytes: Uint8List(3));
      await tester.pumpAndSettle();
      expect(find.text('ielts.pdf · uploaded ${DateTime.now().day}'), findsNothing); // formatted differently; just check the badge changed
      expect(find.textContaining('ielts.pdf'), findsWidgets);
    });
  });
}
