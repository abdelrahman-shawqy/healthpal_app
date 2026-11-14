import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

class AppTextStyles {
  static TextStyle get textMFontNormal => GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.gray500Color,
  );
  static TextStyle get textSmFontSemibold => GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.gray700,
  );

  // Added for the Home screen.

  /// "Search doctor..." placeholder text.
  static TextStyle get textMFontNormalHint => GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.gray400,
  );

  /// Big white title on the specialist banner.
  static TextStyle get headingBannerTitle => GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.5,
    color: AppColors.mainColor,
  );

  /// Small white text under the banner title.
  static TextStyle get textXsFontNormalWhite => GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.35,
    color: AppColors.mainColor,
  );

  /// "Categories" / "Nearby Medical Centers" section titles.
  static TextStyle get headingSection => GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.darkNavy,
  );

  /// Category names under the category icons.
  static TextStyle get textXsFontSemibold => GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: AppColors.gray600,
  );

  /// Medical center name under its image.
  static TextStyle get cardTitle => GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.gray600,
  );

  /// Onboarding page title (bold, ~22px).
  static TextStyle get headingOnboardingTitle => GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 1.4,
    color: AppColors.onboardingTitle,
  );

  /// Onboarding page description (~14px, gray).
  static TextStyle get textMFontNormalDescription => GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.6,
    color: AppColors.onboardingDescription,
  );

  /// Button text style (semibold, ~16px, white).
  static TextStyle get textButtonLabel => GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.mainColor,
  );

  /// Skip button text style (~14px, gray).
  static TextStyle get textSkipButton => GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.skipGray,
  );

  /// Splash app name style (bold, ~28px, white).
  static TextStyle get headingSplashAppName => GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: AppColors.mainColor,
  );
}
