import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gray100,
      ),
      child: const Stack(
        alignment: Alignment.center,
        children: [
          AppSvgIcon(path: AppIcons.notificationIcon, width: 24, height: 24),
          Positioned(top: 8.15, left: 20.15, child: _RedDot()),
        ],
      ),
    );
  }
}

class _RedDot extends StatelessWidget {
  const _RedDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4.7,
      height: 4.7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.notificationDot,
        border: Border.all(color: AppColors.mainColor, width: 0.3),
      ),
    );
  }
}
