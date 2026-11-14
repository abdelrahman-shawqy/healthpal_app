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

  // Splash & onboarding colors
  static const Color splashBackground = Color(0xff1C2A3A); // deep navy/purple background
  static const Color onboardingBg1 = Color(0xffE8F3F1); // light teal/mint
  static const Color onboardingBg2 = Color(0xffFCE4EC); // light pink
  static const Color onboardingBg3 = Color(0xffE0F2F1); // teal
  static const Color buttonNavy = Color(0xff1C2A3A); // dark navy for buttons
  static const Color dotInactive = Color(0xffC4C4C4); // gray dot
  static const Color skipGray = Color(0xff9CA3AF); // skip text
  static const Color onboardingTitle = Color(0xff1C2A3A); // title text
  static const Color onboardingDescription = Color(0xff6B7280); // description text

  // Doctor collage tile muted backgrounds for splash
  static const Color splashTileBlue = Color(0xffBFD3E6);
  static const Color splashTilePink = Color(0xffF3D7D7);
  static const Color splashTileTeal = Color(0xffC8E3DC);
  static const Color splashTileOrange = Color(0xffF0DCCB);
  static const Color splashTileGreen = Color(0xffCFE5D4);
  static const Color splashTilePurple = Color(0xffD9D0E8);
}
