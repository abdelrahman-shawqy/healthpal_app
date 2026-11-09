import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validator,
      style: AppTextStyles.hint.copyWith(color: AppColors.primary),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: AppTextStyles.hint,
        filled: true,
        fillColor: AppColors.fieldBackground,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Icon(icon, size: 18, color: AppColors.hint),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        enabledBorder: _border(AppColors.fieldBorder),
        focusedBorder: _border(AppColors.primary),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(Colors.red),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}