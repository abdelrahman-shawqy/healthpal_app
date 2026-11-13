import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

class ProfileImagePicker extends StatelessWidget {
  final VoidCallback? onTap;

  const ProfileImagePicker({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.socialBorder,
            child: Icon(Icons.person, size: 50, color: AppColors.hint),
          ),
          PositionedDirectional(
            end: 0,
            bottom: 0,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.white, width: 2),
              ),
              child: const Icon(Icons.edit, size: 14, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}