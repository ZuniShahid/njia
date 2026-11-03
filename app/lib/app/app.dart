import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';
import 'theme.dart';

/// Root widget. Light/dark follows the system (prototype: `prefers-color-scheme`).
class NjiaApp extends ConsumerWidget {
  const NjiaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Njia Careers',
      debugShowCheckedModeBanner: false,
      theme: njiaTheme(Brightness.light),
      darkTheme: njiaTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
