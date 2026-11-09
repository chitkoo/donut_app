// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, createdAt: $createdAt)';
  }
}
