import 'package:flutter/material.dart';

import '../../../../../configs/constants/app_size.dart';
import '../../../../../configs/theme/app_theme.dart';
import '../../../../../utils/extensions/context_x.dart';

class TermsAndConditionText extends StatelessWidget {
  const TermsAndConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: small),
      child: Text.rich(
        textAlign: .center,
        TextSpan(
          children: [
            TextSpan(
              text:
                  "By continuing, you acknowledge that you have read and agree to our ",
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.gray,
              ),
            ),
            TextSpan(
              text: "Terms of Use",
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.progress,
              ),
            ),
            TextSpan(
              text: " and ",
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.gray,
              ),
            ),
            TextSpan(
              text: "Privacy Policy.",
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.progress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
