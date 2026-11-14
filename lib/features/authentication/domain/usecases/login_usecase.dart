import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';

class LoginUseCase {
  final AuthRepo _repo;

  const LoginUseCase(this._repo);

  Future<void> call({required String email, required String password}) {
    return _repo.login(email: email, password: password);
  }
}
