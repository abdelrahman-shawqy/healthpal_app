import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector();

  // Language names are always shown in their own language.
  static const Map<String, String> _languages = {
    'en': 'English',
    'ar': 'العربية',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(17),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: context.locale.languageCode,
          isDense: true,
          icon: Padding(
            padding: EdgeInsetsDirectional.only(start: 6),
            child: Image.asset(
              'assets/images/worled_icon.jpg',
              width: 20,
              height: 20,
            ),
          ),
          dropdownColor: AppColors.mainColor,
          borderRadius: BorderRadius.circular(8),
          style: AppTextStyles.textSmFontSemibold,
          items: _languages.entries
              .map(
                (language) => DropdownMenuItem<String>(
                  value: language.key,
                  child: Text(language.value),
                ),
              )
              .toList(),
          onChanged: (languageCode) {
            if (languageCode != null) {
              context.setLocale(Locale(languageCode));
            }
          },
        ),
      ),
    );
  }
}
