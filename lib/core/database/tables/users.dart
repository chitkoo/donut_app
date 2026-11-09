import 'package:drift/drift.dart';

@DataClassName('UserRow')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  TextColumn get phoneNumber => text().unique()();

  DateTimeColumn get dateOfBirth => dateTime()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}