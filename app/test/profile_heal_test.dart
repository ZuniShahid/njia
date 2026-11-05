// A sign-up that failed half-way (account created, no users/{uid} document) must not leave the
// account empty: the profile is created on the next start.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:njia_careers/app/providers.dart';
import 'package:njia_careers/data/auth_service.dart';
import 'package:njia_careers/preview/fakes.dart';

void main() {
  test('signed in without a profile document: the profile is created once', () async {
    final repo = FakeUserRepository();
    final c = ProviderContainer(overrides: [
      firebaseReadyProvider.overrideWithValue(true),
      authServiceProvider.overrideWithValue(FakeAuthService(user: const AuthUser(uid: 'u1', email: 'tino@example.com', displayName: 'Tino'))),
      userRepositoryProvider.overrideWithValue(repo),
    ]);
    addTearDown(c.dispose);
    final sub = c.listen(profileProvider, (_, _) {});
    addTearDown(sub.close);
    for (var i = 0; i < 200 && repo.profileOf('u1') == null; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 1));
    }
    expect(repo.profileOf('u1'), isNotNull, reason: 'profile created');
    expect(repo.profileOf('u1')?.email, 'tino@example.com');
    expect(repo.profileOf('u1')?.displayName, 'Tino');
  });
}
