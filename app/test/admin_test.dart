// /admin/changes with sample change requests: role gate, diff, quote, approve / reject.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/app/router.dart';
import 'package:njia_careers/app/shell.dart';
import 'package:njia_careers/core/models/models.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/preview/sample_data.dart';
import 'package:njia_careers/shared/widgets/view_scaffold.dart';

Future<ProviderContainer> pumpAdmin(WidgetTester tester, {required bool editor}) async {
  tester.view.physicalSize = const Size(1400, 1100);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final profile = editor ? sampleProfile.copyWith(roles: [UserRole.editor]) : sampleProfile;
  await tester.pumpWidget(ProviderScope(overrides: previewOverrides(profile: profile), child: const NjiaApp()));
  await tester.pumpAndSettle();
  final c = ProviderScope.containerOf(tester.element(find.byType(AppShell)));
  c.read(routerProvider).go(Routes.adminChanges);
  await tester.pumpAndSettle();
  return c;
}

void main() {
  testWidgets('students see "Editors only"', (tester) async {
    await pumpAdmin(tester, editor: false);
    expect(find.text('Editors only'), findsOneWidget);
    expect(find.text('Approve'), findsNothing);
  });

  testWidgets('editors see pending changes with diff and quote, and can approve', (tester) async {
    final c = await pumpAdmin(tester, editor: true);
    expect(find.text('Review queue'), findsOneWidget);
    expect(find.textContaining('2 pending changes'), findsOneWidget);
    expect(find.text('FI-student'), findsOneWidget);
    expect(find.text('fee.amount'), findsOneWidget);
    expect(find.text('600'), findsOneWidget);
    expect(find.textContaining('increases to EUR 600'), findsOneWidget);
    expect(find.text('92% confidence'), findsOneWidget);

    await tester.enterText(find.widgetWithText(TextField, 'e.g. verified on the official page on 4 Nov').first, 'checked on migri.fi');
    await tester.tap(find.text('Approve').first);
    await tester.pumpAndSettle();
    final repo = c.read(changeRequestRepositoryProvider) as FakeChangeRequestRepository;
    expect(repo.decisions['cr-preview-1'], (true, 'checked on migri.fi'));
    expect(find.text('FI-student'), findsNothing);
    expect(find.textContaining('1 pending change'), findsOneWidget);
  });

  testWidgets('reject removes the request from the queue', (tester) async {
    final c = await pumpAdmin(tester, editor: true);
    final center = find.descendant(of: find.byType(ViewScaffold), matching: find.byType(Scrollable)).first;
    await tester.scrollUntilVisible(find.text('Reject').first, 250, scrollable: center);
    await tester.tap(find.text('Reject').first);
    await tester.pumpAndSettle();
    final repo = c.read(changeRequestRepositoryProvider) as FakeChangeRequestRepository;
    expect(repo.decisions.values.first.$1, false);
  });
}
