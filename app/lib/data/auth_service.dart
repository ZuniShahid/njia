// Firebase Auth behind a small interface so screens can be tested and previewed without Firebase.
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthUser {
  const AuthUser({required this.uid, this.email, this.displayName});
  final String uid;
  final String? email;
  final String? displayName;
}

/// Thrown by [AuthService] with a short, user-facing English message.
class AuthFailure implements Exception {
  const AuthFailure(this.message, {this.code});
  final String message;
  final String? code;
  @override
  String toString() => message;
}

abstract class AuthService {
  Stream<AuthUser?> authStateChanges();
  AuthUser? get currentUser;
  Future<AuthUser> signInWithEmail(String email, String password);
  Future<AuthUser> createAccount({required String name, required String email, required String password});
  Future<AuthUser> signInWithGoogle();
  Future<void> sendPasswordReset(String email);
  Future<void> changePassword(String newPassword);
  Future<void> deleteAccount();
  Future<void> signOut();
}

class FirebaseAuthService implements AuthService {
  FirebaseAuthService(this._auth);
  final FirebaseAuth _auth;

  static AuthUser? _map(User? u) => u == null ? null : AuthUser(uid: u.uid, email: u.email, displayName: u.displayName);

  @override
  Stream<AuthUser?> authStateChanges() => _auth.authStateChanges().map(_map);

  @override
  AuthUser? get currentUser => _map(_auth.currentUser);

  Future<T> _guard<T>(Future<T> Function() fn) async {
    try {
      return await fn();
    } on FirebaseAuthException catch (e) {
      debugPrint('auth: ${e.code} ${e.message}');
      throw AuthFailure(_message(e.code), code: e.code);
    }
  }

  @override
  Future<AuthUser> signInWithEmail(String email, String password) => _guard(() async {
        final c = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
        return _map(c.user)!;
      });

  @override
  Future<AuthUser> createAccount({required String name, required String email, required String password}) async {
    final displayName = name.trim();
    User user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password)).user!;
    } on FirebaseAuthException catch (e) {
      // Seen in production: the account is created and signed in, but the call still fails with
      // internal-error. Carry on with the signed-in user instead of leaving them without a profile.
      final u = _auth.currentUser;
      debugPrint('createAccount: ${e.code} ${e.message}');
      if (u == null || (u.email ?? '').toLowerCase() != email.trim().toLowerCase()) throw AuthFailure(_message(e.code), code: e.code);
      user = u;
    }
    try {
      await user.updateDisplayName(displayName);
    } catch (e) {
      debugPrint('updateDisplayName: $e'); // the profile document carries the name anyway
    }
    return AuthUser(uid: user.uid, email: user.email, displayName: displayName);
  }

  @override
  Future<AuthUser> signInWithGoogle() => _guard(() async {
        final provider = GoogleAuthProvider();
        final c = kIsWeb ? await _auth.signInWithPopup(provider) : await _auth.signInWithProvider(provider);
        return _map(c.user)!;
      });

  @override
  Future<void> sendPasswordReset(String email) => _guard(() => _auth.sendPasswordResetEmail(email: email.trim()));

  @override
  Future<void> changePassword(String newPassword) => _guard(() => _auth.currentUser!.updatePassword(newPassword));

  @override
  Future<void> deleteAccount() => _guard(() => _auth.currentUser!.delete());

  @override
  Future<void> signOut() => _auth.signOut();

  static String _message(String code) => switch (code) {
        'invalid-email' => 'That email address does not look right.',
        'user-disabled' => 'This account is disabled.',
        'user-not-found' || 'wrong-password' || 'invalid-credential' => 'Email or password is wrong.',
        'email-already-in-use' => 'There is already an account with this email. Sign in instead.',
        'weak-password' => 'Use at least 8 characters.',
        'too-many-requests' => 'Too many attempts. Try again in a few minutes.',
        'network-request-failed' => 'No connection. Check your network and try again.',
        'requires-recent-login' => 'Sign in again, then retry.',
        'popup-closed-by-user' || 'cancelled-popup-request' => 'Google sign-in was cancelled.',
        _ => 'Something went wrong ($code).',
      };
}
