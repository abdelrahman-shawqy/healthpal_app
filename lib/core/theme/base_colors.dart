import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = Colors.white;
  static const Color gray500Color = Color(0xff6B7280);
  static const Color gray700 = Color(0xff374151);

  // Added for the Home screen (taken from the Home design).
  static const Color gray100 = Color(0xffF3F4F6);
  static const Color gray200 = Color(0xffE5E7EB);
  static const Color gray400 = Color(0xff9CA3AF);
  static const Color gray600 = Color(0xff4B5563);
  static const Color darkNavy = Color(0xff1C2A3A);
  static const Color navBarBorder = Color(0xffF7F7F7);
  static const Color notificationDot = Color(0xffEF0000);

  // Semi-transparent colors (alpha is already part of the value).
  static const Color bannerCircleOverlay = Color(0x33D9D9D9); // #D9D9D9 @ 20%
  static const Color heartBackground = Color(0x221F2A37); // #1F2A37 @ 20%
}
