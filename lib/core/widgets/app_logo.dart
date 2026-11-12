import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_images.dart';
import 'package:healthpal_app/core/utils/size_extension.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = width * 107 / 390;

    return SizedBox(
      height: height,
      child: OverflowBox(
        maxWidth: width,
        child: Image.asset(
          AppImages.logo,
          width: width,
          height: height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}