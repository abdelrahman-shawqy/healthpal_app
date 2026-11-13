import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/core/constants/app_images.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/widges/app_svg_icon.dart';
import 'package:healthpal_app/core/widges/search_field.dart';
import 'package:healthpal_app/features/home/presentation/widgets/categories_grid.dart';
import 'package:healthpal_app/features/home/presentation/widgets/category_item.dart';
import 'package:healthpal_app/features/home/presentation/widgets/home_header.dart';
import 'package:healthpal_app/features/home/presentation/widgets/language_selector.dart';
import 'package:healthpal_app/features/home/presentation/widgets/medical_center_card.dart';
import 'package:healthpal_app/features/home/presentation/widgets/notification_button.dart';
import 'package:healthpal_app/features/home/presentation/widgets/section_header.dart';
import 'package:healthpal_app/features/home/presentation/widgets/specialist_carousel.dart';

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
                  const HomeHeader(),
                  const SizedBox(height: 14),
                  const SearchField(),
                  const SizedBox(height: 14),
                  const SpecialistCarousel(slides: _slides),
                  const SizedBox(height: 18),
                  const SectionHeader(titleKey: 'categories'),
                  const SizedBox(height: 12),
                  const CategoriesGrid(),
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
