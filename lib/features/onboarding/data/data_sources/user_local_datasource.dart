import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/database_provider.dart';
import '../../domain/entities/user.dart';

abstract interface class UserLocalDataSource {
  Future<UserRow?> createUser(User user);

  Future<UserRow?> queryUserByPhoneNumber(String phoneNumber);

  Future<UserRow?> queryUserById(int id);

  Future<UserRow?> getUser();

  Future<void> updateUser(User user);

  Future<void> deleteUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl(this._database);

  final AppDatabase _database;

  @override
  Future<UserRow?> queryUserByPhoneNumber(String phoneNumber) {
    return (_database.select(_database.users)
          ..where((table) => table.phoneNumber.equals(phoneNumber)))
        .getSingleOrNull();
  }

  @override
  Future<UserRow?> queryUserById(int id) {
    return (_database.select(
      _database.users,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<UserRow?> createUser(User user) async {
    // return _database
    //     .into(_database.users)
    //     .insert(
    //       UsersCompanion.insert(
    //         firstName: user.firstName,
    //         lastName: user.lastName,
    //         phoneNumber: user.phoneNumber,
    //         dateOfBirth: user.dateOfBirth,
    //       ),
    //     );
    final id = await _database
        .into(_database.users)
        .insert(
          UsersCompanion.insert(
            firstName: user.firstName,
            lastName: user.lastName,
            phoneNumber: user.phoneNumber,
            dateOfBirth: user.dateOfBirth,
          ),
        );

    return (_database.select(
      _database.users,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<UserRow?> getUser() {
    return _database.select(_database.users).getSingleOrNull();
  }

  @override
  Future<void> updateUser(User user) async {
    if (user.id == null) {
      throw ArgumentError('User ID is required for update');
    }

    await (_database.update(
      _database.users,
    )..where((table) => table.id.equals(user.id!))).write(
      UsersCompanion(
        firstName: Value(user.firstName),
        lastName: Value(user.lastName),
        phoneNumber: Value(user.phoneNumber),
        dateOfBirth: Value(user.dateOfBirth),
      ),
    );
  }

  @override
  Future<void> deleteUser() async {
    await _database.delete(_database.users).go();
  }
}

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSourceImpl(ref.watch(appDatabaseProvider));
});
