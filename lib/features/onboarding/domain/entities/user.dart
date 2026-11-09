class User {
  const User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    this.createdAt,
  });

  final int? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final DateTime? createdAt;
}