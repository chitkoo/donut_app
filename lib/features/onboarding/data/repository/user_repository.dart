import '../../domain/entities/user.dart';

abstract interface class UserRepository {
  Future<User> createUser(User user);

  Future<User?> getUserByPhoneNumber(String phoneNumber);

  Future<User?> getUser();

  Future<void> updateUser(User user);

  Future<void> deleteUser();
}
