import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_icons.dart';
import 'package:healthpal_app/features/home/presentation/widgets/category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid();

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
