import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthpal_app/core/routing/routes.dart';
import 'package:healthpal_app/features/authentication/data/repos/auth_repo.dart';
import 'package:healthpal_app/features/authentication/logic/auth_cubit.dart';
import 'package:healthpal_app/features/authentication/presentation/screen/fill_profile_screen.dart';
import 'package:healthpal_app/features/authentication/presentation/screen/forgot_password_screen.dart';
import 'package:healthpal_app/features/authentication/presentation/screen/login_screen.dart';
import 'package:healthpal_app/features/authentication/presentation/screen/register_screen.dart';
import 'package:healthpal_app/features/authentication/presentation/screen/reset_password_screen.dart';
import 'package:healthpal_app/features/home/presentation/screen/home_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // authentication routes
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(AuthRepo()),
            child: const LoginScreen(),
          ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(AuthRepo()),
            child: const RegisterScreen(),
          ),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(AuthRepo()),
            child: const ForgotPasswordScreen(),
          ),
        );

      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const FillProfileScreen());
      // end of authentication routes

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}