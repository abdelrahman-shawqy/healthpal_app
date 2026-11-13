import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepo _repo;

  const SendPasswordResetEmailUseCase(this._repo);

  Future<void> call(String email) => _repo.sendPasswordResetEmail(email);
}
