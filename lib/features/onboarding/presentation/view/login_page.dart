import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../configs/constants/app_size.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../shared/widgets/donut_app_button.dart';
import '../../../../shared/widgets/donut_app_scaffold.dart';
import '../../../../shared/widgets/error_text.dart';
import '../../../../utils/enums/status_enum.dart';
import '../../../../utils/extensions/context_x.dart';
import '../notifiers/auth_notifier.dart';
import 'widgets/onboard_back_button.dart';
import 'widgets/phone_input.dart';
import 'widgets/terms_and_condition_text.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();

    return DonutAppScaffold(
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  OnboardBackButton(),
                  //  CircularProgressIndicator()
                ],
              ),
              veryLargeVerticalSpace,
              Align(
                alignment: .centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    "Enter your phone number",
                    style: context.textTheme.headlineLarge?.copyWith(
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              PhoneInput(
                controller: phoneController,
                onChanged: (String value) {
                  ref.read(authProvider.notifier).updatePhoneNumber(value);
                },
              ),
              smallVerticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  final isPhoneValid = ref.watch(
                    authProvider.select((state) => state.isPhoneValid),
                  );

                  final errMsg = ref.watch(
                    authProvider.select((state) => state.phoneNumberErrorMsg),
                  );

                  if (!isPhoneValid) {
                    return Align(
                      alignment: .centerLeft,
                      child: ErrorText("* $errMsg"),
                    );
                  } else {
                    return noSpace;
                  }
                },
              ),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final isPhoneValid = ref.watch(
                authProvider.select((state) => state.isPhoneValid),
              );

              final isLoading =
                  ref.watch(
                    authProvider.select((state) => state.isPhoneChecking),
                  ) ==
                  RequestStatus.loading;

              ref.listen(authProvider, (prev, next) {
                if (next.isPhoneChecking == RequestStatus.success) {
                  context.pushNamed(AppRoutes.otp);
                }
              });

              return DonutAppButton(
                isLoading: isLoading,
                enabled: isPhoneValid,
                width: double.infinity,
                text: "continue",
                onPressed: () {
                  if (ref.read(authProvider.notifier).checkPhoneValid()) {
                    ref.read(authProvider.notifier).continueWithPhoneNumber();
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
