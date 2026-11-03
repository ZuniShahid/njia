import 'package:flutter/material.dart';

import '../../app/shell.dart';

/// Sign-in / sign-up. Not in the prototype – build from docs (handover task 5).
class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NjiaMark(),
                const SizedBox(height: 20),
                Text('Plan your path to Europe', style: text.headlineSmall),
                const SizedBox(height: 6),
                Text('Sign in to see your goals, roadmap and readiness.', style: text.bodySmall),
                const SizedBox(height: 20),
                Text('Sign-in is not wired up yet.', style: text.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
