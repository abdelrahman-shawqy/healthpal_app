import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';

/// Icons of one bottom navigation tab.
class BottomNavItem {
  const BottomNavItem({required this.icon, required this.selectedIcon});

  /// Icon when the tab is not selected.
  final String icon;

  /// Icon when the tab is selected. If empty, [icon] is used instead.
  final String selectedIcon;
}

/// Bottom navigation bar: icons only, the selected one sits on a gray circle.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
        border: Border(top: BorderSide(color: AppColors.navBarBorder)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;
              final iconPath = isSelected && item.selectedIcon.isNotEmpty
                  ? item.selectedIcon
                  : item.icon;

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(index),
                child: Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.gray100 : null,
                  ),
                  child: AppSvgIcon(path: iconPath, width: 24, height: 24),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
