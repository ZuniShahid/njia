// Preview entry point: the app with sample data and no Firebase.
//   flutter run -t lib/main_preview.dart -d chrome
// Useful to look at screens before the backend is wired up; nothing is persisted.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'preview/fakes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const signedIn = bool.fromEnvironment('SIGNED_IN', defaultValue: true);
  runApp(ProviderScope(overrides: previewOverrides(signedIn: signedIn), child: const NjiaApp()));
}
