import '../../domain/entities/user.dart';

abstract interface class UserRepository {
  Future<int> createUser(User user);

  Future<User?> getUser();

  Future<void> updateUser(User user);

  Future<void> deleteUser();
}
