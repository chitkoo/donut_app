import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthStep { phone, otp, profile, birthday, completed }

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String firstName,
    @Default('') String lastName,

    @Default('') String phoneNumber,
    @Default('') String phoneNumberErrorMsg,
    @Default(true) bool isPhoneValid,

    @Default(3) int otpChanceLeft,
    @Default(0) int resendCountdown,
    @Default(false) bool isResendingOTP,


    DateTime? dateOfBirth,

    @Default(AuthStep.phone) AuthStep currentStep,

    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AuthState;
}
