import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthpal_app/features/authentication/domain/failures/auth_failure.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:healthpal_app/features/authentication/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       _signInWithGoogleUseCase = signInWithGoogleUseCase,
       _sendPasswordResetEmailUseCase = sendPasswordResetEmailUseCase,
       super(const AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    try {
      await _loginUseCase(email: email, password: password);
      emit(const AuthSuccess());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    try {
      await _registerUseCase(name: name, email: email, password: password);
      emit(const AuthSuccess());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthLoading());
    try {
      final signedIn = await _signInWithGoogleUseCase();
      emit(signedIn ? const AuthSuccess() : const AuthInitial());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }

  Future<void> sendResetEmail(String email) async {
    emit(const AuthLoading());
    try {
      await _sendPasswordResetEmailUseCase(email);
      emit(const AuthResetEmailSent());
    } on AuthFailure catch (e) {
      emit(AuthError(e.messageKey));
    }
  }
}
