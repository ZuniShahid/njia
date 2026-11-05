// Preview entry point: the app with sample data and no Firebase.
//   flutter run -t lib/main_preview.dart -d chrome
//   --dart-define=EDITOR=true shows the admin review queue (/admin/changes) with sample requests.
// Useful to look at screens before the backend is wired up; nothing is persisted.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/models/models.dart';
import 'preview/fakes.dart';
import 'preview/sample_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const signedIn = bool.fromEnvironment('SIGNED_IN', defaultValue: true);
  const editor = bool.fromEnvironment('EDITOR', defaultValue: false);
  runApp(ProviderScope(
    overrides: previewOverrides(signedIn: signedIn, profile: editor ? sampleProfile.copyWith(roles: const [UserRole.editor]) : null),
    child: const NjiaApp(),
  ));
}
