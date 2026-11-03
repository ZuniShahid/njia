// Profile screen with sample data: sections, completeness, saving a section.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/app.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/core/models/models.dart';
import 'package:njia_careers/features/profile/profile_view.dart';
import 'package:njia_careers/preview/fakes.dart';
import 'package:njia_careers/preview/sample_data.dart';

Future<ProviderContainer> pumpProfile(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 1000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final scope = ProviderScope(overrides: previewOverrides(), child: const NjiaApp());
  await tester.pumpWidget(scope);
  await tester.pumpAndSettle();
  await tester.tap(find.text('Aminata Kamara').first); // user card in the nav
  await tester.pumpAndSettle();
  return ProviderScope.containerOf(tester.element(find.byType(ProfileView)));
}

void main() {
  test('completeness counts the 14 prototype fields', () {
    expect(profileCompleteness(sampleProfile), 14);
    expect(profileCompleteness(const UserProfile()), 0);
  });

  testWidgets('renders header, identity card and all sections', (tester) async {
    await pumpProfile(tester);
    expect(find.text('Profile'), findsWidgets);
    expect(find.text('Used for every goal. Change it any time.'), findsOneWidget);
    expect(find.text('aminata.kamara@example.com · +232 76 000 000 · Freetown, Sierra Leone'), findsOneWidget);
    for (final s in ['Personal details', 'Education', 'Languages', 'Experience', 'Interests & values', 'Strengths & skills', 'Money', 'Mobility & constraints', 'Notifications', 'Login & security', 'Privacy & data']) {
      expect(find.text(s), findsOneWidget, reason: s);
    }
    expect(find.text('Profile 100% complete'), findsOneWidget);
    expect(find.text('2 of 5'), findsOneWidget);
  });

  testWidgets('saving personal details writes a partial update', (tester) async {
    final container = await pumpProfile(tester);
    final repo = container.read(userRepositoryProvider) as FakeUserRepository;
    await tester.enterText(find.widgetWithText(TextField, 'Freetown'), 'Bo');
    await tester.tap(find.text('Save details'));
    await tester.pumpAndSettle();
    expect(repo.profileOf(sampleUid)!.city, 'Bo');
    expect(repo.profileOf(sampleUid)!.savings?.amount, 2600); // untouched fields survive
    expect(find.text('Details saved'), findsOneWidget);
  });

  testWidgets('toggling an interest chip saves immediately', (tester) async {
    final container = await pumpProfile(tester);
    final repo = container.read(userRepositoryProvider) as FakeUserRepository;
    await tester.tap(find.text('Interests & values'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Leading teams'), 200, scrollable: find.descendant(of: find.byType(ProfileView), matching: find.byType(Scrollable)).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Leading teams'));
    await tester.pumpAndSettle();
    expect(repo.profileOf(sampleUid)!.interests, contains('Leading teams'));
  });
}

