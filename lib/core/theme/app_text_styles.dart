import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

class AppTextStyles {
  static TextStyle get textMFontNormal => GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.gray500Color,
  );
}
