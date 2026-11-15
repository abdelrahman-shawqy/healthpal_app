import 'package:get_it/get_it.dart';
import 'package:healthpal_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:healthpal_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:healthpal_app/features/authentication/domain/repos/auth_repo.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:healthpal_app/features/authentication/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:healthpal_app/features/authentication/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  _auth();
}

void _auth() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SendPasswordResetEmailUseCase>(
    () => SendPasswordResetEmailUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(getIt<AuthRepo>()),
  );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
      signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
      sendPasswordResetEmailUseCase: getIt<SendPasswordResetEmailUseCase>(),
    ),
  );
}