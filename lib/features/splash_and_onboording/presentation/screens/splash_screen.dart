import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_images.dart';
import 'package:healthpal_app/core/routing/routes.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/features/splash_and_onboording/presentation/widgets/doctor_collage_tile.dart';

/// Splash screen matching Screen 1 in Figma:
/// - Dark background.
/// - 3 columns of doctor cards spanning full screen height without layout overflow.
/// - Uses MediaQuery directly for width and height scaling.
/// - Left & Right columns are symmetrically staggered with 4 cards bleeding off edges.
/// - Center column has Top Doctor, Center HealthPal Logo Card, and Bottom Doctor.
/// - Auto-navigation to Onboarding after 2.5 seconds.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    // Auto-navigate to Onboarding after ~2.5 seconds
    _navigationTimer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
      }
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    // Ensures logo stays visible during hot reload
    _animationController.value = 1.0;
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Direct MediaQuery sizing from 390x844 Figma design
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final sideCardHeight = screenHeight * (220 / 844);
    final centerDoctorCardHeight = screenHeight * (280 / 844);
    final logoCardHeight = screenHeight * (160 / 844);
    const cardRadius = 16.0;
    final cardGap = screenHeight * (8 / 844);
    final columnGap = screenWidth * (8 / 390);
    final staggerOffset = screenHeight * (105 / 844);
    final horizontalPadding = screenWidth * (8 / 390);
    final logoSize = screenWidth * (44 / 390);
    final fontSize = (screenWidth / 390) * 16.0;

    return Scaffold(
      backgroundColor: const Color(0xff0F172A), // Dark navy background from Figma
      body: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ==================== Column 1: Left Column ====================
                  Expanded(
                    child: OverflowBox(
                      minHeight: 0,
                      maxHeight: double.infinity,
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(0, -staggerOffset),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding1,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTileBlue,
                            ),
                            SizedBox(height: cardGap),
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding3,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTileTeal,
                            ),
                            SizedBox(height: cardGap),
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding2,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTileOrange,
                            ),
                            SizedBox(height: cardGap),
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding3,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTileGreen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: columnGap),

                  // ==================== Column 2: Center Column ====================
                  Expanded(
                    child: OverflowBox(
                      minHeight: 0,
                      maxHeight: double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Top doctor card: female doctor with curly gray hair
                          DoctorCollageTile(
                            imagePath: AppImages.onboarding1,
                            height: centerDoctorCardHeight,
                            borderRadius: cardRadius,
                            backgroundColor: AppColors.splashTilePink,
                          ),
                          SizedBox(height: cardGap),

                          // Center Card: HealthPal Dark Navy Card
                          Container(
                            height: logoCardHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.splashBackground,
                              borderRadius: BorderRadius.circular(cardRadius),
                            ),
                            child: Center(
                              child: FadeTransition(
                                opacity: _fadeAnimation,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      AppImages.logo,
                                      width: logoSize,
                                      height: logoSize,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.local_hospital_rounded,
                                          size: logoSize,
                                          color: Colors.white,
                                        );
                                      },
                                    ),
                                    SizedBox(height: screenHeight * (8 / 844)),
                                    Text(
                                      'HealthPal',
                                      style: AppTextStyles
                                          .headingSplashAppName
                                          .copyWith(
                                        fontSize: fontSize.clamp(14.0, 18.0),
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: cardGap),

                          // Bottom doctor card: female doctor with stethoscope
                          DoctorCollageTile(
                            imagePath: AppImages.onboarding2,
                            height: centerDoctorCardHeight,
                            borderRadius: cardRadius,
                            backgroundColor: AppColors.splashTileGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: columnGap),

                  // ==================== Column 3: Right Column ====================
                  Expanded(
                    child: OverflowBox(
                      minHeight: 0,
                      maxHeight: double.infinity,
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(0, -staggerOffset),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding3,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTilePurple,
                            ),
                            SizedBox(height: cardGap),
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding2,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTilePink,
                            ),
                            SizedBox(height: cardGap),
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding1,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTileBlue,
                            ),
                            SizedBox(height: cardGap),
                            DoctorCollageTile(
                              imagePath: AppImages.onboarding2,
                              height: sideCardHeight,
                              borderRadius: cardRadius,
                              backgroundColor: AppColors.splashTileTeal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
