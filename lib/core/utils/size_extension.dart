import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  // 390 × 844 is the Figma frame size
  double w(double value) => screenWidth * value / 390;
  double h(double value) => screenHeight * value / 844;

  // responsive font size, clamped so it never gets too small or too big
  double sp(double value) =>
      (screenWidth / 390 * value).clamp(value * 0.85, value * 1.2).toDouble();
}

extension ResponsiveTextStyle on TextStyle {
  TextStyle responsive(BuildContext context) =>
      copyWith(fontSize: context.sp(fontSize ?? 14));
}