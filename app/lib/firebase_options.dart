// Placeholder until the Firebase project `njia-prod` exists (docs/setup.md §1).
// Then replace this file with the output of:
//   dart pub global activate flutterfire_cli
//   flutterfire configure --project=njia-prod --platforms=web,android,ios
// `main.dart` catches the initialisation failure, so the app still starts (without data) in the meantime.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static const String projectId = 'njia-prod';
  static const String region = 'europe-west1';

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not configured for $defaultTargetPlatform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'TODO',
    appId: 'TODO',
    messagingSenderId: 'TODO',
    projectId: projectId,
    authDomain: '$projectId.firebaseapp.com',
    storageBucket: '$projectId.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'TODO',
    appId: 'TODO',
    messagingSenderId: 'TODO',
    projectId: projectId,
    storageBucket: '$projectId.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'TODO',
    appId: 'TODO',
    messagingSenderId: 'TODO',
    projectId: projectId,
    storageBucket: '$projectId.firebasestorage.app',
    iosBundleId: 'com.revana.njia',
  );
}
