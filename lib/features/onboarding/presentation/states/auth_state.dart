import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/enums/auth_step.dart';
import '../../../../utils/enums/status_enum.dart';
import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String firstName,
    @Default('') String lastName,

    @Default('') String phoneNumber,
    @Default('') String phoneNumberErrorMsg,
    @Default(true) bool isPhoneValid,
    @Default(RequestStatus.initial) RequestStatus isPhoneChecking,

    @Default(3) int otpChanceLeft,
    @Default(0) int resendCountdown,
    @Default(false) bool isResendingOTP,
    @Default(false) bool isOTPChecking,

    @Default(RequestStatus.initial) RequestStatus loginStatus,

    User? authUser,
    DateTime? dateOfBirth,
    @Default('') String dobErrorMsg,
    @Default(true) bool isDobValid,

    @Default(AuthStep.phone) AuthStep currentStep,

    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AuthState;
}
