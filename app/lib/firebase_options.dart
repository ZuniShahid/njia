// Web: real values from app/firebase-web-config.json (public client identifiers, project njia-prod).
// Android/iOS: placeholders until those apps are registered – then replace this file with the output of:
//   dart pub global activate flutterfire_cli
//   flutterfire configure --project=njia-prod --platforms=web,android,ios
// `main.dart` catches an initialisation failure, so the app still starts (without data) in the meantime.
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
    apiKey: 'AIzaSyA38e3MntQaIHRcIsg1HfI064kYY__7sU0',
    appId: '1:778432942041:web:6f381c5896e8c60fdf93c8',
    messagingSenderId: '778432942041',
    projectId: 'njia-prod',
    authDomain: 'njia-prod.firebaseapp.com',
    storageBucket: 'njia-prod.firebasestorage.app',
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
