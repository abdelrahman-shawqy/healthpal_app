import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class ProfilePickers {
  static Future<String?> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date == null) return null;
    return '${date.day}/${date.month}/${date.year}';
  }

  static Future<String?> pickGender(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (sheetContext) {
        final male = 'auth.male'.tr();
        final female = 'auth.female'.tr();
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(male),
                onTap: () => Navigator.pop(sheetContext, male),
              ),
              ListTile(
                title: Text(female),
                onTap: () => Navigator.pop(sheetContext, female),
              ),
            ],
          ),
        );
      },
    );
  }
}
