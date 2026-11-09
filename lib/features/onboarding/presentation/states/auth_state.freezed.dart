// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 String get firstName; String get lastName; String get phoneNumber; String get phoneNumberErrorMsg; bool get isPhoneValid; int get otpChanceLeft; int get resendCountdown; bool get isResendingOTP; DateTime? get dateOfBirth; AuthStep get currentStep; bool get isLoading; String? get errorMessage;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AuthState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.phoneNumber, _this.phoneNumber) || other.phoneNumber == _this.phoneNumber)&&(identical(other.phoneNumberErrorMsg, _this.phoneNumberErrorMsg) || other.phoneNumberErrorMsg == _this.phoneNumberErrorMsg)&&(identical(other.isPhoneValid, _this.isPhoneValid) || other.isPhoneValid == _this.isPhoneValid)&&(identical(other.otpChanceLeft, _this.otpChanceLeft) || other.otpChanceLeft == _this.otpChanceLeft)&&(identical(other.resendCountdown, _this.resendCountdown) || other.resendCountdown == _this.resendCountdown)&&(identical(other.isResendingOTP, _this.isResendingOTP) || other.isResendingOTP == _this.isResendingOTP)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.currentStep, _this.currentStep) || other.currentStep == _this.currentStep)&&(identical(other.isLoading, _this.isLoading) || other.isLoading == _this.isLoading)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as AuthState;
  return Object.hash(runtimeType,_this.firstName,_this.lastName,_this.phoneNumber,_this.phoneNumberErrorMsg,_this.isPhoneValid,_this.otpChanceLeft,_this.resendCountdown,_this.isResendingOTP,_this.dateOfBirth,_this.currentStep,_this.isLoading,_this.errorMessage);
}

@override
String toString() {
  final _this = this as AuthState;
  return 'AuthState(firstName: ${_this.firstName}, lastName: ${_this.lastName}, phoneNumber: ${_this.phoneNumber}, phoneNumberErrorMsg: ${_this.phoneNumberErrorMsg}, isPhoneValid: ${_this.isPhoneValid}, otpChanceLeft: ${_this.otpChanceLeft}, resendCountdown: ${_this.resendCountdown}, isResendingOTP: ${_this.isResendingOTP}, dateOfBirth: ${_this.dateOfBirth}, currentStep: ${_this.currentStep}, isLoading: ${_this.isLoading}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String phoneNumber, String phoneNumberErrorMsg, bool isPhoneValid, int otpChanceLeft, int resendCountdown, bool isResendingOTP, DateTime? dateOfBirth, AuthStep currentStep, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? phoneNumber = null,Object? phoneNumberErrorMsg = null,Object? isPhoneValid = null,Object? otpChanceLeft = null,Object? resendCountdown = null,Object? isResendingOTP = null,Object? dateOfBirth = freezed,Object? currentStep = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(AuthState(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumberErrorMsg: null == phoneNumberErrorMsg ? _self.phoneNumberErrorMsg : phoneNumberErrorMsg // ignore: cast_nullable_to_non_nullable
as String,isPhoneValid: null == isPhoneValid ? _self.isPhoneValid : isPhoneValid // ignore: cast_nullable_to_non_nullable
as bool,otpChanceLeft: null == otpChanceLeft ? _self.otpChanceLeft : otpChanceLeft // ignore: cast_nullable_to_non_nullable
as int,resendCountdown: null == resendCountdown ? _self.resendCountdown : resendCountdown // ignore: cast_nullable_to_non_nullable
as int,isResendingOTP: null == isResendingOTP ? _self.isResendingOTP : isResendingOTP // ignore: cast_nullable_to_non_nullable
as bool,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as AuthStep,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String phoneNumber,  String phoneNumberErrorMsg,  bool isPhoneValid,  int otpChanceLeft,  int resendCountdown,  bool isResendingOTP,  DateTime? dateOfBirth,  AuthStep currentStep,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phoneNumber,_that.phoneNumberErrorMsg,_that.isPhoneValid,_that.otpChanceLeft,_that.resendCountdown,_that.isResendingOTP,_that.dateOfBirth,_that.currentStep,_that.isLoading,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String phoneNumber,  String phoneNumberErrorMsg,  bool isPhoneValid,  int otpChanceLeft,  int resendCountdown,  bool isResendingOTP,  DateTime? dateOfBirth,  AuthStep currentStep,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.firstName,_that.lastName,_that.phoneNumber,_that.phoneNumberErrorMsg,_that.isPhoneValid,_that.otpChanceLeft,_that.resendCountdown,_that.isResendingOTP,_that.dateOfBirth,_that.currentStep,_that.isLoading,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String phoneNumber,  String phoneNumberErrorMsg,  bool isPhoneValid,  int otpChanceLeft,  int resendCountdown,  bool isResendingOTP,  DateTime? dateOfBirth,  AuthStep currentStep,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phoneNumber,_that.phoneNumberErrorMsg,_that.isPhoneValid,_that.otpChanceLeft,_that.resendCountdown,_that.isResendingOTP,_that.dateOfBirth,_that.currentStep,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.firstName = '', this.lastName = '', this.phoneNumber = '', this.phoneNumberErrorMsg = '', this.isPhoneValid = true, this.otpChanceLeft = 3, this.resendCountdown = 0, this.isResendingOTP = false, this.dateOfBirth, this.currentStep = AuthStep.phone, this.isLoading = false, this.errorMessage});
  

@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String phoneNumberErrorMsg;
@override@JsonKey() final  bool isPhoneValid;
@override@JsonKey() final  int otpChanceLeft;
@override@JsonKey() final  int resendCountdown;
@override@JsonKey() final  bool isResendingOTP;
@override final  DateTime? dateOfBirth;
@override@JsonKey() final  AuthStep currentStep;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberErrorMsg, phoneNumberErrorMsg) || other.phoneNumberErrorMsg == phoneNumberErrorMsg)&&(identical(other.isPhoneValid, isPhoneValid) || other.isPhoneValid == isPhoneValid)&&(identical(other.otpChanceLeft, otpChanceLeft) || other.otpChanceLeft == otpChanceLeft)&&(identical(other.resendCountdown, resendCountdown) || other.resendCountdown == resendCountdown)&&(identical(other.isResendingOTP, isResendingOTP) || other.isResendingOTP == isResendingOTP)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,firstName,lastName,phoneNumber,phoneNumberErrorMsg,isPhoneValid,otpChanceLeft,resendCountdown,isResendingOTP,dateOfBirth,currentStep,isLoading,errorMessage);
}

@override
String toString() {
    return 'AuthState(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, phoneNumberErrorMsg: $phoneNumberErrorMsg, isPhoneValid: $isPhoneValid, otpChanceLeft: $otpChanceLeft, resendCountdown: $resendCountdown, isResendingOTP: $isResendingOTP, dateOfBirth: $dateOfBirth, currentStep: $currentStep, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String phoneNumber, String phoneNumberErrorMsg, bool isPhoneValid, int otpChanceLeft, int resendCountdown, bool isResendingOTP, DateTime? dateOfBirth, AuthStep currentStep, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? phoneNumber = null,Object? phoneNumberErrorMsg = null,Object? isPhoneValid = null,Object? otpChanceLeft = null,Object? resendCountdown = null,Object? isResendingOTP = null,Object? dateOfBirth = freezed,Object? currentStep = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_AuthState(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumberErrorMsg: null == phoneNumberErrorMsg ? _self.phoneNumberErrorMsg : phoneNumberErrorMsg // ignore: cast_nullable_to_non_nullable
as String,isPhoneValid: null == isPhoneValid ? _self.isPhoneValid : isPhoneValid // ignore: cast_nullable_to_non_nullable
as bool,otpChanceLeft: null == otpChanceLeft ? _self.otpChanceLeft : otpChanceLeft // ignore: cast_nullable_to_non_nullable
as int,resendCountdown: null == resendCountdown ? _self.resendCountdown : resendCountdown // ignore: cast_nullable_to_non_nullable
as int,isResendingOTP: null == isResendingOTP ? _self.isResendingOTP : isResendingOTP // ignore: cast_nullable_to_non_nullable
as bool,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as AuthStep,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
