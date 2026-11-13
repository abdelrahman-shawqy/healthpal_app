import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';

class SignInWithGoogleUseCase {
  final AuthRepo _repo;

  const SignInWithGoogleUseCase(this._repo);

  Future<bool> call() => _repo.signInWithGoogle();
}
