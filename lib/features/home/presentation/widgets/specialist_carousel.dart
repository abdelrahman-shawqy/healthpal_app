import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/app_image.dart';

/// Data of one banner slide.
class SpecialistSlide {
  const SpecialistSlide({
    required this.imagePath,
    required this.titleKey,
    required this.subtitleKey,
  });

  final String imagePath;

  /// Localization keys of the two texts shown on top of the image.
  final String titleKey;
  final String subtitleKey;
}

/// "Looking for Specialist Doctors?" banner: a swipeable [PageView] with a
/// page indicator over the bottom of the image.
class SpecialistCarousel extends StatefulWidget {
  const SpecialistCarousel({super.key, required this.slides});

  final List<SpecialistSlide> slides;

  @override
  State<SpecialistCarousel> createState() => _SpecialistCarouselState();
}

class _SpecialistCarouselState extends State<SpecialistCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The design is 342 x 163; AspectRatio keeps that shape on any width.
    return AspectRatio(
      aspectRatio: 342 / 163,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.slides.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) =>
                  _SlideView(slide: widget.slides[index]),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 6,
              child: IgnorePointer(
                child: CarouselPageIndicator(
                  count: widget.slides.length,
                  currentIndex: _currentPage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// One slide: image, two decorative translucent circles, and the texts.
class _SlideView extends StatelessWidget {
  const _SlideView({required this.slide});

  final SpecialistSlide slide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppImage(path: slide.imagePath),
        // Decorative circles from the design (top-left and bottom).
        Positioned(left: -40, top: -55, child: _circle(154)),
        Positioned(left: 68, top: 151, child: _circle(83)),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12, top: 32),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            // Keeps the text on the left half so it does not cover the doctor.
            child: FractionallySizedBox(
              widthFactor: 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    slide.titleKey.tr(context: context),
                    style: AppTextStyles.headingBannerTitle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    slide.subtitleKey.tr(context: context),
                    style: AppTextStyles.textXsFontNormalWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _circle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bannerCircleOverlay,
      ),
    );
  }
}

/// Row of small bars: the selected one is a long white pill,
/// the others are small light-gray dots.
class CarouselPageIndicator extends StatelessWidget {
  const CarouselPageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isSelected = index == currentIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isSelected ? 30 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.mainColor
                  : AppColors.gray200.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }
}
