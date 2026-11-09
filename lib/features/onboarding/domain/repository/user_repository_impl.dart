import 'package:donut_app/core/database/app_database.dart';
import 'package:donut_app/features/onboarding/data/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data_sources/user_local_datasource.dart';
import '../../domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._localDataSource);

  final UserLocalDataSource _localDataSource;

  @override
  Future<int> createUser(User user) {
    return _localDataSource.createUser(user);
  }

  @override
  Future<User?> getUser() async {
    final row = await _localDataSource.getUser();

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
  Future<void> updateUser(User user) {
    return _localDataSource.updateUser(user);
  }

  @override
  Future<void> deleteUser() {
    return _localDataSource.deleteUser();
  }
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();

  ref.onDispose(database.close);

  return database;
});

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSourceImpl(
    ref.watch(appDatabaseProvider),
  );
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    ref.watch(userLocalDataSourceProvider),
  );
});