import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/constants/app_images.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';
import 'package:healthpal_app/core/widges/search_field.dart';
import 'package:healthpal_app/features/home/presentation/widgets/category_item.dart';
import 'package:healthpal_app/features/home/presentation/widgets/medical_center_card.dart';
import 'package:healthpal_app/features/home/presentation/widgets/section_header.dart';
import 'package:healthpal_app/features/home/presentation/widgets/specialist_carousel.dart';

/// Content of the Home tab (the bottom navigation bar lives in MainScreen).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const double _horizontalPadding = 24;
  static const List<SpecialistSlide> _slides = [
    SpecialistSlide(
      imagePath: 'assets/images/home_image.png',
      titleKey: 'looking_for_specialist_doctors',
      subtitleKey: 'schedule_appointment_with_top_doctors',
    ),
    SpecialistSlide(
      imagePath: 'assets/images/home_image.png',
      titleKey: 'looking_for_specialist_doctors',
      subtitleKey: 'schedule_appointment_with_top_doctors',
    ),
    SpecialistSlide(
      imagePath: 'assets/images/home_image.png',
      titleKey: 'looking_for_specialist_doctors',
      subtitleKey: 'schedule_appointment_with_top_doctors',
    ),
    SpecialistSlide(
      imagePath: 'assets/images/home_image.png',
      titleKey: 'looking_for_specialist_doctors',
      subtitleKey: 'schedule_appointment_with_top_doctors',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _HomeHeader(),
                  const SizedBox(height: 14),
                  const SearchField(),
                  const SizedBox(height: 14),
                  const SpecialistCarousel(slides: _slides),
                  const SizedBox(height: 18),
                  const SectionHeader(titleKey: 'categories'),
                  const SizedBox(height: 12),
                  const _CategoriesGrid(),
                  const SizedBox(height: 18),
                  const SectionHeader(titleKey: 'nearby_medical_centers'),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            // The list starts at the page padding but scrolls to the screen edge.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(
                _horizontalPadding,
                4,
                _horizontalPadding,
                16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MedicalCenterCard(
                    imagePath: AppImages.nearbyMedicalCenters,
                    nameKey: 'sunrise_health_clinic',
                  ),
                  const SizedBox(width: 16),
                  MedicalCenterCard(
                    imagePath: AppImages.goldenCardiologyCenter,
                    nameKey: 'golden_cardiology_center',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

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
          child: _NotificationButton(),
        ),
      ],
    );
  }
}

/// Bell icon in a gray circle with a small red dot.
class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

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

/// Gray search box: search icon + text input.

/// 4 x 2 grid of categories (two rows of four).
class _CategoriesGrid extends StatelessWidget {
  const _CategoriesGrid();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryItem(
              iconPath: AppIcons.dentistryIcon,
              nameKey: 'dentistry',
            ),
            CategoryItem(
              iconPath: AppIcons.cardiologistIcon,
              nameKey: 'cardiology',
            ),
            CategoryItem(
              iconPath: AppIcons.pulmonologistIcon,
              nameKey: 'pulmonology',
            ),
            CategoryItem(iconPath: AppIcons.generalIcon, nameKey: 'general'),
          ],
        ),
        SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryItem(
              iconPath: AppIcons.neurologyIcon,
              nameKey: 'neurology',
            ),
            CategoryItem(
              iconPath: AppIcons.gastroenterologyIcon,
              nameKey: 'gastroenterology',
            ),
            CategoryItem(
              iconPath: AppIcons.laboratoryIcon,
              nameKey: 'laboratory',
            ),
            CategoryItem(
              iconPath: AppIcons.vaccinationIcon,
              nameKey: 'vaccination',
            ),
          ],
        ),
      ],
    );
  }
}
