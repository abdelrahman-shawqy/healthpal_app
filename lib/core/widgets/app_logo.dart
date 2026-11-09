import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_images.dart';
import 'package:healthpal_app/core/utils/size_extension.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      width: context.w(150),
    );
  }
}