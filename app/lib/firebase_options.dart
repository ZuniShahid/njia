// Firebase client config for project njia-prod (public client identifiers, safe to commit).
// Web: app "Njia Careers Web" (app/firebase-web-config.json). Android: "Njia Careers Android", iOS: "Njia Careers iOS",
// both com.revana.njia, registered 3 Nov 2026. Values from `firebase apps:sdkconfig`.
// To regenerate: dart pub global activate flutterfire_cli && flutterfire configure --project=njia-prod --platforms=web,android,ios
// Android Google sign-in additionally needs the SHA-1 of the signing key in Firebase → Project settings → Android app.
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
    apiKey: 'AIzaSyBxgJY4qV32HGZNAwOwutYnOcvstnwjhoI',
    appId: '1:778432942041:android:520c7c2d34c6fcf6df93c8',
    messagingSenderId: '778432942041',
    projectId: projectId,
    storageBucket: '$projectId.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDN6bFRbgJUDAba73HwYAhP9VCC8yICpKA',
    appId: '1:778432942041:ios:12de97deb04a8ce3df93c8',
    messagingSenderId: '778432942041',
    projectId: projectId,
    storageBucket: '$projectId.firebasestorage.app',
    iosBundleId: 'com.revana.njia',
  );
}
