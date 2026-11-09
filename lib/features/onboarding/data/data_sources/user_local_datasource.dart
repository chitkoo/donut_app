import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/user.dart';

abstract interface class UserLocalDataSource {
  Future<int> createUser(User user);

  Future<UserRow?> getUser();

  Future<void> updateUser(User user);

  Future<void> deleteUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl(this._database);

  final AppDatabase _database;

  @override
  Future<int> createUser(User user) {
    return _database.into(_database.users).insert(
      UsersCompanion.insert(
        firstName: user.firstName,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        dateOfBirth: user.dateOfBirth,
      ),
    );
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

    await (_database.update(_database.users)
          ..where((table) => table.id.equals(user.id!)))
        .write(
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