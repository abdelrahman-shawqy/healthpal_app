import 'package:flutter/material.dart';
import 'package:healthpal_app/core/constants/app_images.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

class SocialButtonsSection extends StatelessWidget {
  final String actionText; 
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;

  const SocialButtonsSection({
    super.key,
    required this.actionText,
    this.onGooglePressed,
    this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: AppColors.socialBorder)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('or', style: AppTextStyles.body),
            ),
            const Expanded(child: Divider(color: AppColors.socialBorder)),
          ],
        ),
        const SizedBox(height: 16),
        _SocialButton(
          image: AppImages.google,
          text: '$actionText with Google',
          onPressed: onGooglePressed,
        ),
        const SizedBox(height: 12),
        _SocialButton(
          image: AppImages.facebook,
          text: '$actionText with Facebook',
          onPressed: onFacebookPressed,
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? onPressed;

  const _SocialButton({
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 41,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          side: const BorderSide(color: AppColors.socialBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(image, width: 20, height: 20),
            ),
            Text(text, style: AppTextStyles.socialButton),
          ],
        ),
      ),
    );
  }
}