import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/constants/app_size.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../shared/widgets/donut_app_button.dart';
import '../../../../shared/widgets/donut_app_scaffold.dart';
import '../../../../shared/widgets/error_text.dart';
import '../../../../utils/enums/status_enum.dart';
import '../../../../utils/extensions/context_x.dart';
import '../../../../utils/helpers/helpers.dart';
import '../notifiers/auth_notifier.dart';
import 'widgets/date_input.dart';
import 'widgets/onboard_back_button.dart';
import 'widgets/onboard_progress.dart';
import 'widgets/terms_and_condition_text.dart';

class UserBirthdayPage extends ConsumerWidget {
  const UserBirthdayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dob = ref.watch(authProvider.select((state) => state.dateOfBirth));
    final isAgeValid = ref.watch(
      authProvider.select((state) => state.isDobValid),
    );

    final dobErrorMsg = ref.watch(
      authProvider.select((state) => state.dobErrorMsg),
    );

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
                      ref.read(authProvider.notifier).updateAuthStep(.profile);
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
                    "What's your date of birth?",
                    style: context.textTheme.headlineLarge?.copyWith(
                      letterSpacing: 1.5,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(height: 40),
              DateInput(
                value: dob != null ? getMonthName(dob.month) : "",
                onTap: () {
                  showCustomDatePicker(context, dob, ref);
                },
                placeholderText: "Month",
              ),
              largeVerticalSpace,
              DateInput(
                value: dob != null ? "${dob.day}" : "",
                onTap: () {
                  showCustomDatePicker(context, dob, ref);
                },
                placeholderText: "Day",
              ),
              largeVerticalSpace,
              DateInput(
                value: dob != null ? "${dob.year}" : "",
                onTap: () {
                  showCustomDatePicker(context, dob, ref);
                },
                placeholderText: "Year",
              ),
              largeVerticalSpace,
              if (!isAgeValid) ErrorText(dobErrorMsg),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final isLoading =
                  ref.watch(
                    authProvider.select((state) => state.loginStatus),
                  ) ==
                  RequestStatus.loading;

              final isDOBNotEmpty = ref.watch(
                authProvider.select((state) => state.dateOfBirth != null),
              );

              // ref.listen(authProvider, (prev, next) {
              //   if (next.loginStatus == RequestStatus.success) {
              //     context.goNamed(AppRoutes.dashboard);
              //   }
              // });

              return DonutAppButton(
                enabled: isAgeValid && isDOBNotEmpty,
                isLoading: isLoading,
                width: double.infinity,
                text: "continue",
                onPressed: () {
                  if (isDOBNotEmpty) {
                    ref
                        .read(authProvider.notifier)
                        .createUserAndLogin(
                          onSuccess: () {
                            context.goNamed(AppRoutes.dashboard);
                          },
                        );
                  }
                },
              );
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
