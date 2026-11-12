abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthResetEmailSent extends AuthState {}

class AuthError extends AuthState {
  final String messageKey;

  AuthError(this.messageKey);
}