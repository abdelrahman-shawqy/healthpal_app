import 'package:healthpal_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:healthpal_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:healthpal_app/features/authentication/presentation/cubit/auth_cubit.dart';

abstract class Injection {
  static AuthRepo? _authRepo;

  static AuthRepo get authRepo =>
      _authRepo ??= AuthRepoImpl(AuthRemoteDataSourceImpl());

  static AuthCubit authCubit() {
    final repo = authRepo;
    return AuthCubit(
      loginUseCase: LoginUseCase(repo),
      registerUseCase: RegisterUseCase(repo),
      signInWithGoogleUseCase: SignInWithGoogleUseCase(repo),
      sendPasswordResetEmailUseCase: SendPasswordResetEmailUseCase(repo),
    );
  }
}
