import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_images.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';

/// Reusable app logo widget with logo icon and app name below.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 56,
    this.showName = true,
    this.nameStyle,
  });

  final double size;
  final bool showName;
  final TextStyle? nameStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.logo,
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'lib/features/splash_and_onboording/assets/images/logo.png',
              width: size,
              height: size,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.local_hospital_rounded,
                  size: size,
                  color: Colors.white,
                );
              },
            );
          },
        ),
        if (showName) ...[
          const SizedBox(height: 10),
          Text(
            'app_name'.tr(context: context),
            style: nameStyle ?? AppTextStyles.headingSplashAppName,
          ),
        ],
      ],
    );
  }
}
