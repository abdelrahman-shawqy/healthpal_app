import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/features/calendar/presentation/calendar_screen.dart';
import 'package:healthpal_app/features/home/presentation/screens/home_screen.dart';
import 'package:healthpal_app/features/location/presentation/screens/location_screen.dart';
import 'package:healthpal_app/features/main/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:healthpal_app/features/profile/presentation/profile_screen.dart';

/// Hosts the bottom navigation bar and the 4 main tabs.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static const List<BottomNavItem> _navItems = [
    BottomNavItem(
      icon: AppIcons.homeIcon,
      selectedIcon: AppIcons.homeSelectedIcon,
    ),
    BottomNavItem(
      icon: AppIcons.locationNaveIcon,
      selectedIcon: AppIcons.locationNaveSelectedIcon,
    ),
    BottomNavItem(
      icon: AppIcons.calendarIcon,
      selectedIcon: AppIcons.calendarSelectedIcon,
    ),
    BottomNavItem(
      icon: AppIcons.profileIcon,
      selectedIcon: AppIcons.profileSelectedIcon,
    ),
  ];

  static const List<Widget> _tabs = [
    HomeScreen(),
    LocationScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: AppBottomNavBar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
