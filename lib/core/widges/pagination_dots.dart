import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

/// Animated pagination dots indicator matching the Figma design.
class PaginationDots extends StatelessWidget {
  const PaginationDots({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeColor = AppColors.buttonNavy,
    this.inactiveColor = const Color(0xffD1D5DB),
    this.activeWidth = 24,
    this.dotSize = 6,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double activeWidth;
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaledActiveWidth = screenWidth * (activeWidth / 390);
    final scaledDotSize = screenWidth * (dotSize / 390);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * (3 / 390)),
          width: isActive ? scaledActiveWidth : scaledDotSize,
          height: scaledDotSize,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(scaledDotSize / 2),
          ),
        );
      }),
    );
  }
}
