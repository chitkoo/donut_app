import 'package:flutter/material.dart';

import 'app_typography.dart';

abstract final class AppColors {
  static const onboardingScaffoldBackground = Color(0xFFFCEAF1);
  static const dashboardScaffoldBg = Color(0xFFEEF0F1);
  static const homeHeaderBg = Color(0xFFFFECDC);
  static const labelBg = Color(0xFFFA7C1F);
  static const button = Color(0xFF5ACFEC);
  static const progress = Color(0xFFF25AA0);
  static const purple = Color(0xFF5E5AA7);

  static const text = Colors.black;
  static const white = Colors.white;
  static const gray = Colors.grey;
  static const error = Colors.red;
}

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.button,
        secondary: AppColors.progress,
        surface: AppColors.onboardingScaffoldBackground,
        onPrimary: AppColors.text,
        // onSecondary: AppColors.white,
        onSurface: AppColors.text,
      ),

      // Scaffold
      // scaffoldBackgroundColor: AppColors.onboardingScaffoldBackground,

      // App bar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.onboardingScaffoldBackground,
        foregroundColor: AppColors.text,
        elevation: 0,
        centerTitle: false,
      ),

      // Elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
          foregroundColor: AppColors.text,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      // Filled button
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.button,
          foregroundColor: AppColors.text,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      // Progress indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.progress,
      ),

      // Text theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: AppTypography.barlow,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontFamily: AppTypography.barlow,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          fontFamily: AppTypography.barlow,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontFamily: AppTypography.barlow,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(fontFamily: AppTypography.dmSans, fontSize: 16),
        bodyMedium: TextStyle(fontFamily: AppTypography.dmSans, fontSize: 14),
      ),
    );
  }
}
