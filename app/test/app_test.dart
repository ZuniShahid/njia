// Smoke test: the app shell renders and routes without Firebase.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/theme.dart';
import 'package:njia_careers/preview/fakes.dart';

Widget app({required bool signedIn}) => ProviderScope(overrides: previewOverrides(signedIn: signedIn), child: const NjiaApp());

void main() {
  testWidgets('signed out → auth screen', (tester) async {
    await tester.pumpWidget(app(signedIn: false));
    await tester.pumpAndSettle();
    expect(find.text('Plan the path to the job you want.'), findsOneWidget);
  });

  testWidgets('signed in → cockpit with left nav on a wide screen', (tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(app(signedIn: true));
    await tester.pumpAndSettle();
    expect(find.text('Cockpit'), findsWidgets);
    expect(find.text('YOUR GOAL'), findsOneWidget);
    await tester.tap(find.text('Jobs'));
    await tester.pumpAndSettle();
    expect(find.text('Search and filters; jobs come from APIs and partner feeds only.'), findsOneWidget);
  });

  testWidgets('narrow screen uses the bottom nav', (tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(app(signedIn: true));
    await tester.pumpAndSettle();
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('More'), findsOneWidget);
  });

  test('theme carries the prototype tokens', () {
    final light = njiaTheme(Brightness.light);
    expect(light.extension<NjiaTokens>()!.brand, const Color(0xFF0E5E57));
    expect(njiaTheme(Brightness.dark).extension<NjiaTokens>()!.brand, const Color(0xFF4DB3A6));
    expect(light.textTheme.bodyMedium!.fontFamily, NjiaTokens.fontFamily);
  });
}
