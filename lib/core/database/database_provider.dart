import 'package:donut_app/core/database/app_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();

  ref.onDispose(database.close);

  return database;
});