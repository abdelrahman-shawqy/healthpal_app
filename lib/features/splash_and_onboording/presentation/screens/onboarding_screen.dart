import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/routing/routes.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/custom_button.dart';
import 'package:healthpal_app/core/widges/onboarding_page.dart';
import 'package:healthpal_app/core/widges/pagination_dots.dart';
import 'package:healthpal_app/features/splash_and_onboording/data/models/onboarding_model.dart';

/// Onboarding screen displaying three walkthrough slides with PageView.
///
/// Matches Figma design using direct MediaQuery sizing:
/// - Full-bleed doctor portrait image on top.
/// - Centered title and description.
/// - Fixed bottom controls: "Next" / "Get Started" button, pagination dots, and "Skip" button.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < OnboardingModel.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _onSkip() {
    _finishOnboarding();
  }

  void _finishOnboarding() {
    Navigator.pushReplacementNamed(context, Routes.mainScreen);
  }

  @override
  Widget build(BuildContext context) {
    // Sizing via MediaQuery matching Figma 390x844
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final isLastPage = _currentPage == OnboardingModel.pages.length - 1;
    final horizontalPadding = screenWidth * (24 / 390);
    final bottomPadding = screenHeight * (16 / 844);
    final buttonHeight = screenHeight * (52 / 844);
    final buttonGap = screenHeight * (16 / 844);
    final dotsGap = screenHeight * (10 / 844);
    final skipHeight = screenHeight * (36 / 844);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Swiping area: Doctor portrait + Title + Description
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingModel.pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = OnboardingModel.pages[index];
                  return OnboardingPageWidget(
                    imagePath: page.imagePath,
                    backgroundColor: page.backgroundColor,
                    titleKey: page.titleKey,
                    descriptionKey: page.descriptionKey,
                  );
                },
              ),
            ),

            // Fixed bottom controls area matching Figma
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                horizontalPadding,
                0,
                horizontalPadding,
                bottomPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Next / Get Started button
                  CustomButton.filled(
                    text: (isLastPage ? 'get_started' : 'next')
                        .tr(context: context),
                    onPressed: _onNext,
                    borderRadius: 14,
                    height: buttonHeight,
                  ),
                  SizedBox(height: buttonGap),

                  // Pagination Dots Indicator
                  PaginationDots(
                    count: OnboardingModel.pages.length,
                    currentIndex: _currentPage,
                    activeColor: AppColors.buttonNavy,
                    inactiveColor: const Color(0xffD1D5DB),
                    activeWidth: screenWidth * (24 / 390),
                    dotSize: screenWidth * (6 / 390),
                  ),
                  SizedBox(height: dotsGap),

                  // Skip button
                  CustomButton.text(
                    text: 'skip'.tr(context: context),
                    textColor: AppColors.skipGray,
                    onPressed: _onSkip,
                    height: skipHeight,
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
