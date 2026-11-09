import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/routing/routes.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/utils/size_extension.dart';
import 'package:healthpal_app/core/widgets/custom_button.dart';
import 'package:healthpal_app/core/widgets/custom_text_field.dart';
import 'package:healthpal_app/features/authentication/presentation/widgets/profile_image_picker.dart';
import 'package:healthpal_app/features/authentication/presentation/widgets/success_dialog.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final _nameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      _dobController.text = '${date.day}/${date.month}/${date.year}';
    }
  }

  Future<void> _pickGender() async {
    final gender = await showModalBottomSheet<String>(
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
    if (gender != null) {
      _genderController.text = gender;
    }
  }

  Future<void> _onSave() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const SuccessDialog(),
    );
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.homeScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const BackButton(color: AppColors.primary),
        title: Text('auth.fill_profile'.tr(), style: AppTextStyles.title),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.w(24)),
          child: Column(
            children: [
              SizedBox(height: context.h(16)),
              ProfileImagePicker(onTap: () {}),
              SizedBox(height: context.h(32)),
              CustomTextField(
                controller: _nameController,
                hintText: 'auth.full_name'.tr(),
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nicknameController,
                hintText: 'auth.nickname'.tr(),
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                hintText: 'name@example.com',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _dobController,
                hintText: 'auth.date_of_birth'.tr(),
                icon: Icons.calendar_today_outlined,
                readOnly: true,
                onTap: _pickDate,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _genderController,
                hintText: 'auth.gender'.tr(),
                icon: Icons.person_outline,
                readOnly: true,
                onTap: _pickGender,
                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.hint,
                ),
              ),
              SizedBox(height: context.h(32)),
              CustomButton(text: 'auth.save'.tr(), onPressed: _onSave),
              SizedBox(height: context.h(24)),
            ],
          ),
        ),
      ),
    );
  }
}