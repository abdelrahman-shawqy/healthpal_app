import 'package:flutter/material.dart';

/// Scales dimensions proportionally from the 390×844 reference design.
class ResponsiveHelper {
  ResponsiveHelper._(this.context);
  final BuildContext context;

  static const double _designWidth = 390;
  static const double _designHeight = 844;

  double get screenWidth => MediaQuery.sizeOf(context).width;
  double get screenHeight => MediaQuery.sizeOf(context).height;

  /// Fraction of total screen height (e.g. 0.6 for 60%).
  double heightPercent(double factor) => screenHeight * factor;

  /// Fraction of total screen width (e.g. 0.8 for 80%).
  double widthPercent(double factor) => screenWidth * factor;

  /// Scale a horizontal value proportionally from reference width.
  double scaleWidth(double value) => value * screenWidth / _designWidth;

  /// Scale a vertical value proportionally from reference height.
  double scaleHeight(double value) => value * screenHeight / _designHeight;

  /// Scale font size based on width ratio, clamped for accessibility.
  double scaleFontSize(double value) {
    final scale = screenWidth / _designWidth;
    return value * scale.clamp(0.8, 1.3);
  }
}

/// Extension on [BuildContext] for easy responsive calculations.
extension ResponsiveExtension on BuildContext {
  ResponsiveHelper get responsive => ResponsiveHelper._(this);
}
