import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/onboarding/presentation/notifiers/auth_notifier.dart';
import '../extensions/context_x.dart';

/// [Date picker]
Future<dynamic> showCustomDatePicker(
  BuildContext context,
  DateTime? dob,
  WidgetRef ref,
) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Container(
        height: 375,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pick your birth date",
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text("Done"),
                  ),
                ],
              ),
            ),

            Expanded(
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: dob ?? DateTime(1990, 1, 1),
                  minimumDate: DateTime(1900, 1, 1),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (date) {
                    ref.read(authProvider.notifier).onBirthDateChanged(date);
                  },

                  changeReportingBehavior:
                      ChangeReportingBehavior.onScrollUpdate,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

String getMonthName(int month) {
  return const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ][month - 1];
}

