// "Ask Njia": the coach on the same page – from a roadmap step, and the button that appears after
// scrolling (2 s delay, one peek per view).
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/router.dart';
import 'package:njia_careers/app/shell.dart';
import 'package:njia_careers/features/assistant/assistant.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/shared/widgets/view_scaffold.dart';

Future<ProviderContainer> pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 1000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(overrides: previewOverrides(), child: const NjiaApp()));
  await tester.pumpAndSettle();
  return ProviderScope.containerOf(tester.element(find.byType(AppShell)));
}

void main() {
  test('ghostwriting requests are caught before the server', () {
    expect(asksForGhostwriting('Please write my motivation letter'), isTrue);
    expect(asksForGhostwriting('How long does the visa take?'), isFalse);
  });

  testWidgets('roadmap "Ask coach" opens the chat on the roadmap, about that step', (tester) async {
    final c = await pumpApp(tester);
    final router = c.read(routerProvider);
    router.go(Routes.roadmap);
    await tester.pumpAndSettle();
    final center = find.descendant(of: find.byType(ViewScaffold), matching: find.byType(Scrollable)).first;
    await tester.scrollUntilVisible(find.text('Master of Finance').first, 250, scrollable: center, maxScrolls: 60);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Master of Finance').first);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('step-ask-coach')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('assistant-panel')), findsOneWidget);
    expect(find.textContaining('About: Step '), findsOneWidget);
    expect(router.routeInformationProvider.value.uri.path, Routes.roadmap, reason: 'stays on the roadmap');
    expect(c.read(assistantProvider).context['stepKey'], isNotNull);

    await tester.tap(find.text('What does this step need?'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Preview answer'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('assistant-input')), 'Write my letter for me');
    await tester.testTextInput.receiveAction(TextInputAction.send);
    await tester.pumpAndSettle();
    expect(find.textContaining("I won't write it for you"), findsOneWidget);
  });

  testWidgets('scrolling shows the button after 2 s, with a one-question peek', (tester) async {
    await pumpApp(tester);
    expect(find.byKey(const Key('assistant-fab')), findsNothing);
    final center = find.descendant(of: find.byType(ViewScaffold), matching: find.byType(Scrollable)).first;
    await tester.drag(center, const Offset(0, -300));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1500));
    expect(find.byKey(const Key('assistant-fab')), findsNothing, reason: 'not before 2 s');
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('assistant-fab')), findsOneWidget);
    expect(find.byKey(const Key('assistant-peek')), findsOneWidget);
    expect(find.text('What should I do this week?'), findsOneWidget);

    await tester.tap(find.text('Open chat →'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('assistant-panel')), findsOneWidget);
    expect(find.text('About: Cockpit'), findsOneWidget);

    await tester.tap(find.byKey(const Key('assistant-fab')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('assistant-panel')), findsNothing);
    expect(find.byKey(const Key('assistant-fab')), findsOneWidget, reason: 'the button stays once shown');
  });

  testWidgets('no assistant on the Coach page itself', (tester) async {
    final c = await pumpApp(tester);
    c.read(assistantProvider.notifier).openChat();
    c.read(routerProvider).go(Routes.coach);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('assistant-fab')), findsNothing);
    expect(find.byKey(const Key('assistant-panel')), findsNothing);
  });
}
