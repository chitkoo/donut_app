enum AuthStep { phone, otp, profile, birthday }

extension AuthStepExtension on AuthStep {
  // double get progress => (index + 1) / AuthStep.values.length;
  double get progress => switch (this) {
    AuthStep.phone => 0.25,
    AuthStep.otp => 0.50,
    AuthStep.profile => 0.75,
    AuthStep.birthday => 1.0,
  };

  int get stepNumber => index + 1;
}
