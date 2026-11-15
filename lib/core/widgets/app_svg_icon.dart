import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Shows an SVG asset.
///
/// If [path] is empty (asset not provided yet) it shows an empty box with the
/// same size instead of calling `SvgPicture.asset('')`, which would crash.
class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon({super.key, required this.path, this.width, this.height});

  final String path;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return SizedBox(width: width, height: height);
    }
    return SvgPicture.asset(path, width: width, height: height);
  }
}
