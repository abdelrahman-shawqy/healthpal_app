import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';

class SearchField extends StatelessWidget {
  const SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const AppSvgIcon(path: AppIcons.searchIcon, width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: AppTextStyles.textMFontNormal,
              decoration: InputDecoration.collapsed(
                hintText: 'search_doctor'.tr(context: context),
                hintStyle: AppTextStyles.textMFontNormalHint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
