import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/providers.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseReady = await initFirebase();
  runApp(
    ProviderScope(
      overrides: [firebaseReadyProvider.overrideWithValue(firebaseReady)],
      child: const NjiaApp(),
    ),
  );
}

/// Firebase init with offline-first Firestore (docs/architecture.md → Offline first).
/// Returns false when Firebase is not configured yet (placeholder firebase_options.dart); the app
/// then runs without data so screens can still be developed and tested.
Future<bool> initFirebase() async {
  try {
    // On web the Firebase JS SDK is fetched at runtime; don't let a dead network block the first frame.
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).timeout(const Duration(seconds: 15));
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    return true;
  } catch (e) {
    debugPrint('Firebase not initialised: $e');
    return false;
  }
}
