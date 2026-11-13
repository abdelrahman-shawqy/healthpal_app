import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_images.dart';

/// Data model representing a single onboarding slide.
class OnboardingModel {
  const OnboardingModel({
    required this.imagePath,
    required this.backgroundColor,
    required this.titleKey,
    required this.descriptionKey,
  });

  final String imagePath;
  final Color backgroundColor;
  final String titleKey;
  final String descriptionKey;

  /// Default list of the 3 onboarding pages matching Figma design.
  static const List<OnboardingModel> pages = [
    OnboardingModel(
      imagePath: AppImages.onboarding1,
      backgroundColor: Colors.white,
      titleKey: 'onboarding_title_1',
      descriptionKey: 'onboarding_desc_1',
    ),
    OnboardingModel(
      imagePath: AppImages.onboarding2,
      backgroundColor: Colors.white,
      titleKey: 'onboarding_title_2',
      descriptionKey: 'onboarding_desc_2',
    ),
    OnboardingModel(
      imagePath: AppImages.onboarding3,
      backgroundColor: Color(0xff45989B),
      titleKey: 'onboarding_title_3',
      descriptionKey: 'onboarding_desc_3',
    ),
  ];
}
