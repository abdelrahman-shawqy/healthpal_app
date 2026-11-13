import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/app_image.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';

/// Medical center card: image with a heart button on top, name below.
class MedicalCenterCard extends StatelessWidget {
  const MedicalCenterCard({
    super.key,
    required this.imagePath,
    required this.nameKey,
  });

  final String imagePath;

  final String nameKey;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.600,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 1),
          BoxShadow(
            color: Color(0x17000000),
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(3, 3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: AppImage(
                  path: imagePath,
                  width: width,
                  height: height * 0.145,
                ),
              ),
              const PositionedDirectional(
                top: 8,
                end: 8,
                child: _FavoriteButton(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Text(
              nameKey.tr(context: context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.cardTitle,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 25.35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.heartBackground,
        borderRadius: BorderRadius.circular(12.675),
      ),
      child: const Icon(Icons.favorite_border, size: 20, color: Colors.white),
    );
  }
}
