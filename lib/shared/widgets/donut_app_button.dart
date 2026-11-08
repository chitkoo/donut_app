import 'package:flutter/material.dart';

import '../../configs/constants/app_size.dart';
import '../../utils/extensions/context_x.dart';
import '../../utils/extensions/mediaquery_x.dart';

class DonutAppButton extends StatelessWidget {
  const DonutAppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
    this.enabled = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SizedBox(
      width: width ?? context.wp(80),
      child: ElevatedButton(
        onPressed: enabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: foregroundColor ?? Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: appButtonPaddingX,
            vertical: appButtonPaddingY,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appButtonRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor ?? Colors.white,
                ),
              )
            : Text(
                text.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: foregroundColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
      ),
    );
  }
}
