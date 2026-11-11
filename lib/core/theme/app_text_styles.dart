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
}
