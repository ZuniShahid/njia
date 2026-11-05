// Auth screen with the fake auth service: validation, wrong password, sign-in, create account.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/preview/fakes.dart';

Future<void> pumpApp(WidgetTester tester, {Size size = const Size(1400, 900)}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(overrides: previewOverrides(signedIn: false), child: const NjiaApp()));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('shows the pitch and the sign-in form', (tester) async {
    await pumpApp(tester);
    expect(find.text('Plan the path to the job you want.'), findsOneWidget);
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
  });

  testWidgets('validates email and password', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();
    expect(find.text('Enter a valid email.'), findsOneWidget);
    expect(find.text('Enter your password.'), findsOneWidget);
  });

  testWidgets('eye icon shows and hides the password', (tester) async {
    await pumpApp(tester);
    bool obscured() => tester.widget<TextField>(find.descendant(of: find.byType(TextFormField).at(1), matching: find.byType(TextField))).obscureText;
    expect(obscured(), isTrue);
    await tester.tap(find.byKey(const Key('toggle-password')));
    await tester.pump();
    expect(obscured(), isFalse);
    await tester.tap(find.byKey(const Key('toggle-password')));
    await tester.pump();
    expect(obscured(), isTrue);
  });

  testWidgets('wrong password shows the auth error', (tester) async {
    await pumpApp(tester);
    await tester.enterText(find.byType(TextFormField).at(0), 'aminata.kamara@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'nope');
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('auth-error')), findsOneWidget);
    expect(find.text('Email or password is wrong.'), findsOneWidget);
  });

  testWidgets('sign in lands on the cockpit', (tester) async {
    await pumpApp(tester);
    await tester.enterText(find.byType(TextFormField).at(0), 'aminata.kamara@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'prototype');
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsNothing);
    expect(find.text('Head of Department · Deutsche Bank'), findsWidgets); // goal switcher in the nav
  });

  testWidgets('create account needs the terms checkbox, then signs in', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.text('Create account').first);
    await tester.pumpAndSettle();
    expect(find.text('Create your account'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'Fatmata Sesay');
    await tester.enterText(find.byType(TextFormField).at(1), 'fatmata@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'longpassword');
    await tester.tap(find.widgetWithText(FilledButton, 'Create account'));
    await tester.pumpAndSettle();
    expect(find.text('Please agree to the privacy policy.'), findsOneWidget);
    await tester.tap(find.byType(Checkbox));
    await tester.tap(find.widgetWithText(FilledButton, 'Create account'));
    await tester.pumpAndSettle();
    expect(find.text('Create your account'), findsNothing);
    expect(find.text('Add your first goal'), findsOneWidget); // new user, no goals yet
  });

  testWidgets('narrow layout stacks the pitch above the form', (tester) async {
    await pumpApp(tester, size: const Size(400, 900));
    expect(find.text('Plan the path to the job you want.'), findsOneWidget);
    expect(find.text('Tell us your dream job'), findsNothing); // steps hidden ≤ 860 px
  });
}
