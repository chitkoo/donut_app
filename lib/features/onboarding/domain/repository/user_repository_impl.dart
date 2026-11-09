import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data_sources/user_local_datasource.dart';
import '../../data/repository/user_repository.dart';
import '../../domain/entities/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userLocalDataSourceProvider));
});

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._localDataSource);

  final UserLocalDataSource _localDataSource;

  @override
  Future<User> createUser(User user) async {
    // return _localDataSource.createUser(user);
    final row = await _localDataSource.createUser(user);

    if (row == null) {
      throw Exception('Failed to retrieve created user');
    }

    return User(
      id: row.id,
      firstName: row.firstName,
      lastName: row.lastName,
      phoneNumber: row.phoneNumber,
      dateOfBirth: row.dateOfBirth,
      createdAt: row.createdAt,
    );
  }

  @override
  Future<User?> getUserByPhoneNumber(String phoneNumber) async {
    final row = await _localDataSource.queryUserByPhoneNumber(phoneNumber);

    if (row == null) return null;

    return User(
      id: row.id,
      firstName: row.firstName,
      lastName: row.lastName,
      phoneNumber: row.phoneNumber,
      dateOfBirth: row.dateOfBirth,
      createdAt: row.createdAt,
    );
  }

  @override
  Future<User?> getUserById(int id) async {
    final row = await _localDataSource.queryUserById(id);

    if (row == null) return null;

    return User(
      id: row.id,
      firstName: row.firstName,
      lastName: row.lastName,
      phoneNumber: row.phoneNumber,
      dateOfBirth: row.dateOfBirth,
      createdAt: row.createdAt,
    );
  }

  // @override
  // Future<User?> getUser() async {
  //   final row = await _localDataSource.getUser();

  //   if (row == null) return null;

  //   return User(
  //     id: row.id,
  //     firstName: row.firstName,
  //     lastName: row.lastName,
  //     phoneNumber: row.phoneNumber,
  //     dateOfBirth: row.dateOfBirth,
  //     createdAt: row.createdAt,
  //   );
  // }

  // @override
  // Future<void> updateUser(User user) {
  //   return _localDataSource.updateUser(user);
  // }

  // @override
  // Future<void> deleteUser() {
  //   return _localDataSource.deleteUser();
  // }
}
