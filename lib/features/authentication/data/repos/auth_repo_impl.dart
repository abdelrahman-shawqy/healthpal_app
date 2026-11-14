import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthpal_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:healthpal_app/features/authentication/domain/failures/auth_failure.dart';
import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remote;

  const AuthRepoImpl(this._remote);

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _guard(
      () => _remote.register(name: name, email: email, password: password),
    );
  }

  @override
  Future<void> login({required String email, required String password}) {
    return _guard(() => _remote.login(email: email, password: password));
  }

  @override
  Future<bool> signInWithGoogle() => _guard(_remote.signInWithGoogle);

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return _guard(() => _remote.sendPasswordResetEmail(email));
  }

  @override
  Future<void> logout() => _remote.logout();

  Future<T> _guard<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    } on GoogleSignInException {
      throw const AuthFailure('auth.error_unknown');
    }
  }

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
      case 'account-exists-with-different-credential':
        return const AuthFailure('auth.error_account_exists');
      default:
        return const AuthFailure('auth.error_unknown');
    }
  }
}
