import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo _repo;

  const RegisterUseCase(this._repo);

  Future<void> call({
    required String name,
    required String email,
    required String password,
  }) {
    return _repo.register(name: name, email: email, password: password);
  }
}
