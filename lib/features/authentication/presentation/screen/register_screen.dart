import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/routing/routes.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/utils/size_extension.dart';
import 'package:healthpal_app/core/widgets/app_logo.dart';
import 'package:healthpal_app/core/widgets/custom_button.dart';
import 'package:healthpal_app/core/widgets/custom_text_field.dart';
import 'package:healthpal_app/features/authentication/presentation/widgets/auth_footer_text.dart';
import 'package:healthpal_app/features/authentication/presentation/widgets/social_buttons_section.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.w(24)),
          child: Column(
            children: [
              SizedBox(height: context.h(40)),
              const AppLogo(),
              SizedBox(height: context.h(32)),
              Text('auth.create_account'.tr(), style: AppTextStyles.title),
              const SizedBox(height: 4),
              Text(
                'auth.create_account_subtitle'.tr(),
                style: AppTextStyles.subtitle,
              ),
              SizedBox(height: context.h(24)),
              CustomTextField(
                controller: _nameController,
                hintText: 'auth.your_name'.tr(),
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                hintText: 'auth.your_email'.tr(),
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                hintText: 'auth.password'.tr(),
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              SizedBox(height: context.h(24)),
              CustomButton(
                text: 'auth.create_account'.tr(),
                // مؤقت لحد ما نربط Firebase
                onPressed: () => Navigator.pushNamed(context, Routes.profile),
              ),
              SizedBox(height: context.h(24)),
              SocialButtonsSection(
                googleText: 'auth.continue_with_google'.tr(),
                facebookText: 'auth.continue_with_facebook'.tr(),
              ),
              SizedBox(height: context.h(24)),
              AuthFooterText(
                text: 'auth.have_account'.tr(),
                actionText: 'auth.sign_in_link'.tr(),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.login),
              ),
              SizedBox(height: context.h(24)),
            ],
          ),
        ),
      ),
    );
  }
}