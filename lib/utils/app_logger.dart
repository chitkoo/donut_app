import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 100,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.none,
  ),
);

final loggerProvider = Provider<Logger>((ref) {
  return appLogger;
});