import 'package:donut_app/core/router/app_routes.dart';
import 'package:donut_app/features/auth/domain/entities/auth_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String? authRedirect({
  required AsyncValue<AuthSession?> session,
  required String location,
}) {
  const guestRoutes = {
    AppRoutePaths.onboarding,
    AppRoutePaths.login,
    AppRoutePaths.otp,
    AppRoutePaths.username,
    AppRoutePaths.birthday,
  };

  final isSplash = location == AppRoutePaths.splash;
  // final isDashboard = location == AppRoutePaths.dashboard;
  // final isDashboard = location.startsWith(AppRoutePaths.dashboard);
  final isDashboard = {
    AppRoutePaths.home,
    AppRoutePaths.reward,
    AppRoutePaths.setting,
  }.contains(location);

  final isGuestRoute = guestRoutes.contains(location);

  // Wait for session restoration.
  if (session.isLoading) {
    return isSplash ? null : AppRoutePaths.splash;
  }

  // A restoration error is treated as unauthenticated.
  final isAuthenticated = session.asData?.value != null;

  if (isAuthenticated) {
    // Authenticated users should not revisit registration.
    if (isSplash || isGuestRoute) {
      return AppRoutePaths.home;
    }

    return null;
  }

  // Unauthenticated users cannot access dashboard.
  if (isDashboard || isSplash) {
    return AppRoutePaths.onboarding;
  }

  return null;
}
