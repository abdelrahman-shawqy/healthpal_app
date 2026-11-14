sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess();
}

class AuthResetEmailSent extends AuthState {
  const AuthResetEmailSent();
}

class AuthError extends AuthState {
  final String messageKey;

  const AuthError(this.messageKey);
}
