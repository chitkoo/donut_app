import 'dart:async';

import 'package:donut_app/utils/enums/auth_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../configs/constants/app_default_values.dart';
import '../../../../utils/app_logger.dart';
import '../../data/repository/user_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository_impl.dart';
import '../../domain/validators/age_validator.dart';
import '../../domain/validators/phonenumber_validator.dart';
import '../states/auth_state.dart';

final authProvider = NotifierProvider.autoDispose<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthState> {
  Timer? _otpTimer;

  late final UserRepository _userRepository;
  late final Logger _logger;

  @override
  AuthState build() {
    ref.onDispose(() => _otpTimer?.cancel());

    _userRepository = ref.read(userRepositoryProvider);
    _logger = ref.read(loggerProvider);

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

  /// [Check Phone Number]
  Future<void> continueWithPhoneNumber({
    required VoidCallback onSuccess,
  }) async {
    state = state.copyWith(isPhoneChecking: .loading);

    try {
      final user = await _userRepository.getUserByPhoneNumber(
        state.phoneNumber,
      );

      _logger.i(user.toString());

      if (user != null) {
        state = state.copyWith(authUser: user, isPhoneChecking: .success);
      } else {
        state = state.copyWith(isPhoneChecking: .success);
      }
      onSuccess.call();
      updateAuthStep(AuthStep.otp);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      // state = state.copyWith(isPhoneChecking: .initial);
    }
  }

  /// [Login]
  Future<void> createUserAndLogin({
    required VoidCallback onSuccess,
  }) async {
    state = state.copyWith(loginStatus: .loading);

    try {
      await Future.delayed(Duration(milliseconds: 1500));

      final user = await _userRepository.createUser(
        User(
          firstName: state.firstName,
          lastName: state.lastName,
          phoneNumber: state.phoneNumber,
          dateOfBirth: state.dateOfBirth!,
        ),
      );

      _logger.i(user.toString());

      state = state.copyWith(authUser: user, loginStatus: .success);
      onSuccess.call();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), loginStatus: .fail);
    } finally {
      // state = state.copyWith(loginStatus: .initial);
    }
  }

  Future<bool> checkOTP(String otp) async {
    state = state.copyWith(
      isLoading: true,
      firstName: "",
      lastName: "",
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
    final isAgeValid = AgeValidator.isValidDateOfBirth(value);

    if (isAgeValid) {
      state = state.copyWith(dateOfBirth: value, isDobValid: true);
    } else {
      state = state.copyWith(
        dateOfBirth: null,
        dobErrorMsg: "Age must be at least 13 years old!",
        isDobValid: false,
      );
    }
  }

  void updateAuthStep(AuthStep value) {
    state = state.copyWith(currentStep: value);
  }
}
