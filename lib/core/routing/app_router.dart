import 'package:flutter/material.dart';
import 'package:healthpal_app/core/routing/routes.dart';
import 'package:healthpal_app/features/main/presentation/screens/main_screen.dart';
import 'package:healthpal_app/features/splash_and_onboording/presentation/screens/splash_screen.dart';
import 'package:healthpal_app/features/splash_and_onboording/presentation/screens/onboarding_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
