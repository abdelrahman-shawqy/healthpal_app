import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';

/// One category: a 62x62 SVG icon with its name below.
/// (The colored rounded square is already part of the SVG asset.)
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.iconPath, required this.nameKey});

  final String iconPath;

  /// Localization key of the category name.
  final String nameKey;

  static const double iconSize = 62;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iconSize,
      child: Column(
        children: [
          AppSvgIcon(path: iconPath, width: iconSize, height: iconSize),
          const SizedBox(height: 6),
          Text(
            nameKey.tr(context: context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.textXsFontSemibold,
          ),
        ],
      ),
    );
  }
}
