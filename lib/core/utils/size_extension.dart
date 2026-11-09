import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double w(double value) => screenWidth * value / 390;
  double h(double value) => screenHeight * value / 844;
}