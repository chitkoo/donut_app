import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../../../configs/constants/app_default_values.dart';
import '../../../../configs/constants/app_size.dart';
import '../../../../configs/theme/app_theme.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../shared/widgets/donut_app_scaffold.dart';
import '../../../../shared/widgets/error_text.dart';
import '../../../../utils/extensions/context_x.dart';
import '../notifiers/auth_notifier.dart';
import 'widgets/onboard_back_button.dart';
import 'widgets/terms_and_condition_text.dart';

class OtpPage extends HookConsumerWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = useTextEditingController();
    final pinFocusNode = useFocusNode();

    final shakeController = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );

    const focusedBorderColor = AppColors.button;

    final defaultPinTheme = PinTheme(
      width: 45,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: focusedBorderColor, width: 1),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(color: AppColors.white),
    );

    useEffect(() {
      ref.read(authProvider.notifier).startOtpCountdown();
      return null;
    }, const []);

    return DonutAppScaffold(
      body: Column(
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
            child: Text(
              "Verify your number",
              style: context.textTheme.headlineLarge?.copyWith(
                letterSpacing: 1.5,
              ),
            ),
          ),
          mediumVerticalSpace,
          Consumer(
            builder: (context, ref, child) {
              final phoneNumber = ref.watch(
                authProvider.select((state) => state.phoneNumber),
              );

              return Align(
                alignment: .centerLeft,
                child: Text(
                  "We've sent 6 digits OTP to $phoneNumber.",
                  style: context.textTheme.bodyMedium?.copyWith(),
                ),
              );
            },
          ),
          SizedBox(height: 40),
          Consumer(
            builder: (context, ref, child) {
              final enabled = ref.watch(
                authProvider.select((state) => state.otpChanceLeft > 0),
              );

              return AnimatedBuilder(
                animation: shakeController,
                builder: (context, child) {
                  final progress = shakeController.value;

                  final offset =
                      math.sin(progress * math.pi * 10) * 8 * (1 - progress);

                  return Transform.translate(
                    offset: Offset(offset, 0),
                    child: child,
                  );
                },
                child: Pinput(
                  enabled: enabled,
                  length: 6,
                  controller: pinController,
                  focusNode: pinFocusNode,
                  autofocus: true,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 15),
                  validator: (value) {
                    return value == AppDefaultValues.defaultOTP
                        ? null
                        : 'OTP is incorrect!';
                  },
                  obscureText: true,
                  obscuringCharacter: "*",
                  hapticFeedbackType: HapticFeedbackType.lightImpact,

                  onCompleted: (pin) async {
                    final isValid = await ref
                        .read(authProvider.notifier)
                        .checkOTP(pin);

                    if (!context.mounted) return;

                    if (isValid) {
                      pinController.clear();
                      context.pushNamed(AppRoutes.username);
                    } else {
                      shakeController.forward(from: 0);
                      pinController.clear();
                      // pinFocusNode.requestFocus();
                    }
                  },
                  onChanged: (value) {
                    // debugPrint('onChanged: $value');s
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                ),
              );
            },
          ),
          mediumVerticalSpace,
          Consumer(
            builder: (context, ref, child) {
              final retryLeft = ref.watch(
                authProvider.select((state) => state.otpChanceLeft),
              );

              if (retryLeft == 0) {
                return ErrorText(
                  " * You've 3 wrong OTP attempts! Please wait a while and try again.",
                );
              } else {
                return noSpace;
              }
            },
          ),
          mediumVerticalSpace,
          Align(
            alignment: .centerLeft,
            child: Text(
              "Didn't receive the code?",
              style: context.textTheme.bodyMedium,
            ),
          ),

          Align(
            alignment: .centerLeft,
            child: Consumer(
              builder: (context, ref, child) {
                final countdown = ref.watch(
                  authProvider.select((state) => state.resendCountdown),
                );
                final minutes = (countdown ~/ 60).toString().padLeft(2, '0');
                final seconds = (countdown % 60).toString().padLeft(2, '0');

                // final isResending = ref.watch(
                //   authProvider.select((state) => state.isResendingOtp),
                // );

                if (countdown > 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "resend in"),
                          TextSpan(
                            text: " $minutes:$seconds ",
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.progress,
                            ),
                          ),
                          TextSpan(text: "mins."),
                        ],
                      ),
                    ),
                  );
                }

                return TextButton(
                  onPressed: () => ref.read(authProvider.notifier).resendOTP(),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text('Resend OTP'),
                );
              },
            ),
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
