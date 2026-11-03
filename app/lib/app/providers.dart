// App-wide Riverpod providers: Firebase handles, auth state, repositories.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/content_repository.dart';
import '../data/jobs_repository.dart';
import '../data/user_repository.dart';

/// Set by main() – false while firebase_options.dart is still the placeholder.
final firebaseReadyProvider = Provider<bool>((_) => false);

final firestoreProvider = Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);
final firebaseAuthProvider = Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final authStateProvider = StreamProvider<User?>((ref) {
  if (!ref.watch(firebaseReadyProvider)) return Stream.value(null);
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

/// null = still loading, false = signed out, true = signed in. Used by the router redirect.
final isSignedInProvider = Provider<bool?>((ref) {
  final auth = ref.watch(authStateProvider);
  return auth.when(data: (u) => u != null, loading: () => null, error: (_, _) => false);
});

final contentRepositoryProvider = Provider<ContentRepository>((ref) => ContentRepository(ref.watch(firestoreProvider)));
final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepository(ref.watch(firestoreProvider)));
final jobsRepositoryProvider = Provider<JobsRepository>((ref) => JobsRepository(ref.watch(firestoreProvider)));
