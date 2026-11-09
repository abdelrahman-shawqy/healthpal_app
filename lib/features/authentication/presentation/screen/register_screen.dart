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
              Text('Create Account', style: AppTextStyles.title),
              const SizedBox(height: 4),
              Text('We are here to help you!', style: AppTextStyles.subtitle),
              SizedBox(height: context.h(24)),
              CustomTextField(
                controller: _nameController,
                hintText: 'Your Name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                hintText: 'Your Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              SizedBox(height: context.h(24)),
              CustomButton(text: 'Create Account', onPressed: () {}),
              SizedBox(height: context.h(24)),
              const SocialButtonsSection(actionText: 'Continue'),
              SizedBox(height: context.h(24)),
              AuthFooterText(
                text: 'Do you have an account?',
                actionText: 'Sign in',
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