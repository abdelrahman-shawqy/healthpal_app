import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Container(
          child: Column(
            children: [
              SvgPicture.asset(AppIcons.dentistryIcon),
              Text('location'.tr(), style: AppTextStyles.textMFontNormal),
              GestureDetector(
                onTap: () {
                  context.setLocale(Locale('ar'));
                },
                child: Container(height: 50, width: 50, color: Colors.green),
              ),
              GestureDetector(
                onTap: () {
                  context.setLocale(Locale('en'));
                },
                child: Container(height: 50, width: 50, color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
