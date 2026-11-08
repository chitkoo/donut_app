import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  // ThemeData
  ThemeData get theme => Theme.of(this);

  // ColorScheme
  ColorScheme get colorScheme => theme.colorScheme;

  // TextTheme
  TextTheme get textTheme => theme.textTheme;
}
