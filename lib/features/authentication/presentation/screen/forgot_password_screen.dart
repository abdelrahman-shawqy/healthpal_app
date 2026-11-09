import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';
import 'package:healthpal_app/core/utils/size_extension.dart';
import 'package:healthpal_app/core/widgets/app_logo.dart';
import 'package:healthpal_app/core/widgets/custom_button.dart';
import 'package:healthpal_app/core/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const BackButton(color: AppColors.primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.w(24)),
          child: Column(
            children: [
              SizedBox(height: context.h(16)),
              const AppLogo(),
              SizedBox(height: context.h(32)),
              Text('auth.forgot_password_title'.tr(), style: AppTextStyles.title),
              const SizedBox(height: 4),
              Text(
                'auth.forgot_password_subtitle'.tr(),
                style: AppTextStyles.subtitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.h(24)),
              CustomTextField(
                controller: _emailController,
                hintText: 'auth.your_email'.tr(),
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: context.h(24)),
              CustomButton(text: 'auth.send_code'.tr(), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}