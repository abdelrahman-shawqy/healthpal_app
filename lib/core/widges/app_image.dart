import 'package:flutter/material.dart';
import 'package:healthpal_app/core/theme/base_colors.dart';

/// Shows a normal (png/jpg) image asset.
///
/// If [path] is empty (asset not provided yet) it shows a plain gray box
/// instead of calling `Image.asset('')`, which would throw.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return Container(width: width, height: height, color: AppColors.gray200);
    }
    return Image.asset(path, width: width, height: height, fit: fit);
  }
}
