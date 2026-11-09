import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/constants/app_assets.dart';
import '../../../../configs/constants/app_size.dart';
import '../../../../configs/theme/app_theme.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../shared/widgets/donut_app_button.dart';
import '../../../../utils/extensions/context_x.dart';
import 'widgets/social_login_row.dart';
import 'widgets/terms_and_condition_text.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: .infinity,
        height: .infinity,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          image: DecorationImage(
            image: AssetImage(AppAssets.onboardBackground),
            fit: .cover,
          ),
        ),

        alignment: .bottomCenter,
        child: Stack(
          clipBehavior: .none,
          children: [
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.onboardingScaffoldBackground.withValues(
                        alpha: 0.85,
                      ),
                      blurRadius: 15,
                      spreadRadius: 4,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.onboardingScaffoldBackground.withValues(
                      alpha: 0.95,
                    ),
                    blurRadius: 15,
                    spreadRadius: 4,
                    offset: const Offset(0, -10),
                  ),
                ],
                color: AppColors.onboardingScaffoldBackground,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: .end,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      "Round food for \nevery mood",
                      style: context.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: 35),

                    DonutAppButton(
                      text: "Let's get started",
                      onPressed: () {
                        context.pushNamed(AppRoutes.login);
                      },
                    ),
                    smallVerticalSpace,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: context.textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: "Log In",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoutes.login);
                              },
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: AppColors.progress,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    veryLargeVerticalSpace,
                    const SocialLoginRow(),
                    veryLargeVerticalSpace,

                    TermsAndConditionText(),
                    massiveVerticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
