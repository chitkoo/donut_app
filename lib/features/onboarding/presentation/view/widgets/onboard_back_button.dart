import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardBackButton extends StatelessWidget {
  const OnboardBackButton({
    super.key,
    this.onPressed,
    this.size = 12,
    this.borderRadius = 10,
  });

  final VoidCallback? onPressed;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          onPressed ??
          () {
            if (context.canPop()) {
              context.pop();
            }
          },
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        fixedSize: Size(size, size),
        tapTargetSize: .shrinkWrap,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      icon: const Icon(Icons.keyboard_backspace_rounded, size: 28),
    );
  }
}
