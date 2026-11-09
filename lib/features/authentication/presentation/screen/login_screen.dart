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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
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
              Text('auth.welcome_back'.tr(), style: AppTextStyles.title),
              const SizedBox(height: 4),
              Text('auth.welcome_subtitle'.tr(), style: AppTextStyles.subtitle),
              SizedBox(height: context.h(24)),
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
              CustomButton(text: 'auth.sign_in'.tr(), onPressed: () {}),
              SizedBox(height: context.h(24)),
              SocialButtonsSection(
                googleText: 'auth.sign_in_with_google'.tr(),
                facebookText: 'auth.sign_in_with_facebook'.tr(),
              ),
              SizedBox(height: context.h(24)),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.forgotPassword),
                child: Text(
                  'auth.forgot_password_link'.tr(),
                  style: AppTextStyles.link,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: context.h(16)),
              AuthFooterText(
                text: 'auth.no_account'.tr(),
                actionText: 'auth.sign_up'.tr(),
                onTap: () => Navigator.pushNamed(context, Routes.register),
              ),
              SizedBox(height: context.h(24)),
            ],
          ),
        ),
      ),
    );
  }
}