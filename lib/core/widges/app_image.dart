import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

/// Shows a normal (png/jpg) image asset with robust fallback and error handling.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return Container(width: width, height: height, color: AppColors.gray200);
    }

    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        // Try fallback location if path was copied from feature folder
        final alternatePath = path.contains('assets/images/')
            ? path.replaceFirst(
                'assets/images/',
                'lib/features/splash_and_onboording/assets/images/',
              )
            : path.replaceFirst(
                'lib/features/splash_and_onboording/assets/images/',
                'assets/images/',
              );

        return Image.asset(
          alternatePath,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            // Secondary fallback: show home_image or gray container
            return Image.asset(
              'assets/images/home_image.png',
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: height,
                  color: AppColors.gray200,
                );
              },
            );
          },
        );
      },
    );
  }
}
