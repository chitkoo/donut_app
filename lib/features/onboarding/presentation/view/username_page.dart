import 'package:donut_app/features/onboarding/presentation/view/widgets/onboard_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../configs/constants/app_size.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../shared/widgets/donut_app_button.dart';
import '../../../../shared/widgets/donut_app_scaffold.dart';
import '../../../../shared/widgets/error_text.dart';
import '../../../../utils/enums/auth_step.dart';
import '../../../../utils/extensions/context_x.dart';
import '../notifiers/auth_notifier.dart';
import 'widgets/onboard_back_button.dart';
import 'widgets/terms_and_condition_text.dart';
import 'widgets/username_input.dart';

class UsernamePage extends HookConsumerWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();

    return DonutAppScaffold(
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  OnboardBackButton(
                    onBackInvoked: () {
                      ref.read(authProvider.notifier).updateAuthStep(.otp);
                    },
                  ),
                  AuthStepProgress(),
                ],
              ),
              veryLargeVerticalSpace,
              Align(
                alignment: .centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    "What's your name?",
                    style: context.textTheme.headlineLarge?.copyWith(
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              UsernameInput(
                controller: firstNameController,
                placeholderText: "First Name",
                onChanged: (String value) {
                  ref.read(authProvider.notifier).onFirstNameChanged(value);
                },
              ),
              if (ref.watch(
                authProvider.select((state) => state.firstName.isEmpty),
              )) ...[
                smallVerticalSpace,
                Align(
                  alignment: .centerLeft,
                  child: ErrorText("* First name cannot be empty!"),
                ),
              ],
              largeVerticalSpace,
              UsernameInput(
                controller: lastNameController,
                placeholderText: "Last Name (Optional)",
                onChanged: (String value) {
                  ref.read(authProvider.notifier).onLastNameChanged(value);
                },
              ),
            ],
          ),
          DonutAppButton(
            width: double.infinity,
            text: "continue",
            enabled: ref.watch(
              authProvider.select((state) => state.firstName.trim().isNotEmpty),
            ),
            onPressed: () {
              context.pushNamed(AppRoutes.birthday);
              ref.read(authProvider.notifier).updateAuthStep(AuthStep.birthday);
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: TermsAndConditionText(),
      ),
    );
  }
}
