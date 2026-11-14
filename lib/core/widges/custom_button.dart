import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/app_text_styles.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

/// Button visual variant.
enum ButtonVariant { filled, outlined, text }

/// A fully parameterized custom button used across the entire application.
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.filled,
    this.width,
    this.height = 56,
    this.backgroundColor = AppColors.buttonNavy,
    this.textColor = AppColors.mainColor,
    this.borderRadius = 16,
    this.textStyle,
    this.borderColor,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
  });

  /// Primary filled variant (default).
  const CustomButton.filled({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 56,
    this.backgroundColor = AppColors.buttonNavy,
    this.textColor = AppColors.mainColor,
    this.borderRadius = 16,
    this.textStyle,
    this.borderColor,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
  }) : variant = ButtonVariant.filled;

  /// Outlined variant with border.
  const CustomButton.outlined({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 56,
    this.backgroundColor = Colors.transparent,
    this.textColor = AppColors.buttonNavy,
    this.borderRadius = 16,
    this.textStyle,
    this.borderColor = AppColors.buttonNavy,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
  }) : variant = ButtonVariant.outlined;

  /// Text-only variant (used for "Skip" and secondary text links).
  const CustomButton.text({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 40,
    this.backgroundColor = Colors.transparent,
    this.textColor = AppColors.skipGray,
    this.borderRadius = 16,
    this.textStyle,
    this.borderColor,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
  }) : variant = ButtonVariant.text;

  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Widget? icon;
  final bool isLoading;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Direct MediaQuery scaling
    final scaledHeight = height > 100
        ? height
        : screenHeight * (height / 844);
    final effectiveWidth = width != null
        ? (width! > 100 ? width! : screenWidth * (width! / 390))
        : double.infinity;

    final effectiveStyle = textStyle ??
        (variant == ButtonVariant.text
            ? AppTextStyles.textSkipButton.copyWith(color: textColor)
            : AppTextStyles.textButtonLabel.copyWith(color: textColor));

    final effectiveOnPressed = isEnabled && !isLoading ? onPressed : null;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: (variant == ButtonVariant.outlined && borderColor != null)
          ? BorderSide(color: borderColor!, width: 1.5)
          : BorderSide.none,
    );

    Widget content;
    if (isLoading) {
      content = SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      );
    } else {
      final label = Text(
        text,
        textAlign: TextAlign.center,
        style: effectiveStyle,
      );
      content = icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                const SizedBox(width: 8),
                Flexible(child: label),
              ],
            )
          : label;
    }

    return SizedBox(
      width: effectiveWidth,
      height: scaledHeight,
      child: variant == ButtonVariant.text
          ? TextButton(
              onPressed: effectiveOnPressed,
              style: TextButton.styleFrom(
                foregroundColor: textColor,
                shape: shape,
                padding: EdgeInsets.zero,
              ),
              child: content,
            )
          : ElevatedButton(
              onPressed: effectiveOnPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                disabledBackgroundColor: backgroundColor.withValues(alpha: 0.5),
                shape: shape,
                elevation: variant == ButtonVariant.outlined ? 0 : 0,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: content,
            ),
    );
  }
}
