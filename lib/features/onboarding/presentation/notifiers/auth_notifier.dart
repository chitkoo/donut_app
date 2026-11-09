import 'dart:async';

import 'package:donut_app/configs/constants/app_default_values.dart';
import 'package:donut_app/features/onboarding/domain/validators/phonenumber_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/auth_state.dart';

final authProvider = NotifierProvider.autoDispose<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthState> {
  Timer? _otpTimer;

  @override
  AuthState build() {
    ref.onDispose(() => _otpTimer?.cancel());

    return const AuthState();
  }

  void updatePhoneNumber(String value) {
    final error = PhoneNumberValidator.validate(value);

    if (error != null) {
      state = state.copyWith(phoneNumberErrorMsg: error, isPhoneValid: false);
    } else {
      final phone = PhoneNumberValidator.normalize(value);
      state = state.copyWith(
        phoneNumber: phone,
        phoneNumberErrorMsg: "",
        isPhoneValid: true,
      );
    }
  }

  bool checkPhoneValid() {
    return state.phoneNumber.isNotEmpty && state.isPhoneValid;
  }

  Future<bool> checkOTP(String otp) async {
    state = state.copyWith(
      isLoading: true,
      // otpErrorMsg: '',
      // isOTPValid: false,
    );

    try {
      final isValid = otp == AppDefaultValues.defaultOTP;

      if (!isValid) {
        state = state.copyWith(
          isLoading: false,
          otpChanceLeft: state.otpChanceLeft - 1,

          // otpErrorMsg: 'OTP is incorrect!',
        );

        return false;
      }

      state = state.copyWith(
        isLoading: false,
        otpChanceLeft: 3,

        // isOTPValid: true,
      );

      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());

      return false;
    }
  }

  void startOtpCountdown() async {
    await Future.delayed(Duration(milliseconds: 300));
    if (_otpTimer?.isActive ?? false) return;

    state = state.copyWith(resendCountdown: AppDefaultValues.otpResendInterval);

    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendCountdown <= 1) {
        timer.cancel();
        _otpTimer = null;

        state = state.copyWith(resendCountdown: 0);
        return;
      }

      state = state.copyWith(resendCountdown: state.resendCountdown - 1);
    });
  }

  Future<void> resendOTP() async {
    if (state.resendCountdown > 0) return;
    // || state.isResendingOtp
    // )

    // state = state.copyWith(isResendingOtp: true);

    try {
      state = state.copyWith(otpChanceLeft: 3);
      startOtpCountdown();
    } catch (e) {
      state = state.copyWith(
        // isResendingOtp: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetOtpCountdown() {
    _otpTimer?.cancel();
    _otpTimer = null;
    state = state.copyWith(resendCountdown: 0);
  }

  bool checkIsNameValid() {
    return state.firstName.isNotEmpty;
  }

  void onFirstNameChanged(String value) {
    state = state.copyWith(firstName: value);
  }

  void onLastNameChanged(String value) {
    state = state.copyWith(lastName: value);
  }

  void onBirthDateChanged(DateTime value) {
    state = state.copyWith(dateOfBirth: value);
  }

  void updateAuthStep(String value) {}
}
