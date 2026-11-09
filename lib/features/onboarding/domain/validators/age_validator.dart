class AgeValidator {
  static const int legalAge = 13;

  static bool isValidDateOfBirth(DateTime? dob) {
    if (dob == null) return false;

    final today = DateTime.now();

    if (dob.isAfter(today)) return false;

    /// [Check whole age]
    var age = today.year - dob.year;

    /// [date for this year birthday]
    final birthdayThisYear = DateTime(today.year, dob.month, dob.day);

    /// [eg. born in 5 Dec 2013,by calculating year only give 13 but birthdayThisYear = 5 Dec 2026 and current month is not December yet... so we reduce 1 year ]
    if (today.isBefore(birthdayThisYear)) {
      age--;
    }

    return age >= legalAge;
  }
}
