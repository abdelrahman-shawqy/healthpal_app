import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';
import 'package:healthpal_app/features/home/presentation/widgets/language_selector.dart';
import 'package:healthpal_app/features/home/presentation/widgets/notification_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'location'.tr(context: context),
                style: AppTextStyles.textMFontNormal,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const AppSvgIcon(path: AppIcons.locationIcon),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'location_seattle_usa'.tr(context: context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textSmFontSemibold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const AppSvgIcon(
                    path: AppIcons.arrowDownIcon,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Bell is 10 px lower than the top of the "Location" label in the design.
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LanguageSelector(),
              SizedBox(width: 8),
              NotificationButton(),
            ],
          ),
        ),
      ],
    );
  }
}
