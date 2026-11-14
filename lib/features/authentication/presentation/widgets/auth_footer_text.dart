import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/utils/size_extension.dart';

class AuthFooterText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;

  const AuthFooterText({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$text ',
        style: AppTextStyles.smallBody.responsive(context),
        children: [
          TextSpan(
            text: actionText,
            style: AppTextStyles.smallLink.responsive(context),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}