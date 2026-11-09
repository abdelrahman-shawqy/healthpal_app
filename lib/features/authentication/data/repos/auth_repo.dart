import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthpal_app/features/authentication/data/models/auth_failure.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  Future<void> logout() => _auth.signOut();

  AuthFailure _mapError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const AuthFailure('auth.error_invalid_email');
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return const AuthFailure('auth.error_wrong_credentials');
      case 'email-already-in-use':
        return const AuthFailure('auth.error_email_in_use');
      case 'weak-password':
        return const AuthFailure('auth.error_weak_password');
      case 'user-disabled':
        return const AuthFailure('auth.error_user_disabled');
      case 'too-many-requests':
        return const AuthFailure('auth.error_too_many_requests');
      case 'network-request-failed':
        return const AuthFailure('auth.error_network');
      default:
        return const AuthFailure('auth.error_unknown');
    }
  }
}