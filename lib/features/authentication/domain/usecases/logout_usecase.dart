import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';

class LogoutUseCase {
  final AuthRepo _repo;

  const LogoutUseCase(this._repo);

  Future<void> call() => _repo.logout();
}
