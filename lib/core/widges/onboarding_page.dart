import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';

/// Reusable onboarding page widget representing a single slide.
///
/// Matches Figma design using direct MediaQuery sizing:
/// - Top 532px ratio: Full-bleed doctor portrait image with matching background.
/// - Bottom section: Centered bold title and gray description text with overflow protection.
class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.imagePath,
    required this.backgroundColor,
    required this.titleKey,
    required this.descriptionKey,
  });

  final String imagePath;
  final Color backgroundColor;
  final String titleKey;
  final String descriptionKey;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Top doctor image is 532px on 844px Figma design
    final imageHeight = screenHeight * (532 / 844);
    final horizontalPadding = screenWidth * (28 / 390);
    final titleFontSize = (screenWidth / 390) * 24.0;
    final descFontSize = (screenWidth / 390) * 14.0;
    final textGap = screenHeight * (10 / 844);
    final textPadding = screenHeight * (8 / 844);

    return Column(
      children: [
        // Top full-bleed doctor portrait image
        Container(
          width: double.infinity,
          height: imageHeight,
          color: backgroundColor,
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),

        // Text area: Title & Description with overflow protection
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: horizontalPadding,
                vertical: textPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleKey.tr(context: context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headingOnboardingTitle.copyWith(
                      fontSize: titleFontSize.clamp(20.0, 26.0),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: textGap),
                  Text(
                    descriptionKey.tr(context: context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textMFontNormalDescription.copyWith(
                      fontSize: descFontSize.clamp(12.0, 16.0),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
