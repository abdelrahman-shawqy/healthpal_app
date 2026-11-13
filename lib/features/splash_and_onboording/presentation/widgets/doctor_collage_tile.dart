import 'package:flutter/material.dart';

/// A rounded doctor portrait tile matching Figma Screen 1.
class DoctorCollageTile extends StatelessWidget {
  const DoctorCollageTile({
    super.key,
    required this.imagePath,
    this.backgroundColor = Colors.transparent,
    required this.height,
    this.borderRadius = 16,
  });

  final String imagePath;
  final Color backgroundColor;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: double.infinity,
        height: height,
        color: backgroundColor,
        child: Image.asset(
          imagePath,
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: height,
              color: backgroundColor,
            );
          },
        ),
      ),
    );
  }
}
