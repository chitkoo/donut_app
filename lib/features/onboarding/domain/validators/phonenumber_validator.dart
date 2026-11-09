class PhoneNumberValidator {
  static String? validate(String input) {
    final phone = input.trim().replaceAll(RegExp(r'\D'), '');

    if (phone.isEmpty) {
      return 'Phone number is required';
    }

    if (phone.startsWith("09")) {
      /// `to remove 09 and check between 7-9 digits`
      if (phone.substring(2).length < 7) {
        return 'Please enter a valid phone number';
      }
      return null;
    } else {
      return 'Please enter phone number starting with 09';
    }
  }

  static String normalize(String input) {
    var phone = input.trim().replaceAll(RegExp(r'\D'), '');

    if (phone.startsWith('09')) {
      phone = phone.substring(1);
    } else if (!phone.startsWith('9')) {
      phone = '9$phone';
    }

    return '+95$phone';
  }
}
