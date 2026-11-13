import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';

/// Section title on the left and "See All" on the right
/// (used by Categories and Nearby Medical Centers).
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.titleKey});

  /// Localization key of the section title.
  final String titleKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleKey.tr(context: context), style: AppTextStyles.headingSection),
        Text('see_all'.tr(context: context), style: AppTextStyles.textMFontNormal),
      ],
    );
  }
}
