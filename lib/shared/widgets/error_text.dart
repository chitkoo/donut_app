import 'package:donut_app/configs/theme/app_theme.dart';
import 'package:donut_app/utils/extensions/context_x.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.bodyMedium?.copyWith(color: AppColors.error),
    );
  }
}
