import 'package:flutter/material.dart';

extension MediaQueryX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get width => screenSize.width;

  double get height => screenSize.height;

  double wp(double value) => width * value / 100;

  double hp(double value) => height * value / 100;
}
