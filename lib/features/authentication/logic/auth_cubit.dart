import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthpal_app/features/authentication/data/models/auth_failure.dart';
import 'package:healthpal_app/features/authentication/data/repos/auth_repo.dart';
import 'package:healthpal_app/features/authentication/logic/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo;

  AuthCubit(this._repo) : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await _repo.login(email: email, password: password);
      emit(AuthSuccess());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await _repo.register(name: name, email: email, password: password);
      emit(AuthSuccess());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final signedIn = await _repo.signInWithGoogle();
      emit(signedIn ? AuthSuccess() : AuthInitial());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }

  Future<void> sendResetEmail(String email) async {
    emit(AuthLoading());
    try {
      await _repo.sendPasswordResetEmail(email);
      emit(AuthResetEmailSent());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }
}