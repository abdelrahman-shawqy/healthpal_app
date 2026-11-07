import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/localization/app_localization.dart';
import 'package:healthpal_app/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: AppLocalization.path,
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      startLocale: AppLocalization.startLocal,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
