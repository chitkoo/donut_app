import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

import '../../features/dashboard/presentation/view/dashboard_page.dart';
import '../../features/onboarding/presentation/view/login_page.dart';
import '../../features/onboarding/presentation/view/onboarding_page.dart';
import '../../features/onboarding/presentation/view/otp_page.dart';
import '../../features/onboarding/presentation/view/user_birthday_page.dart';
import '../../features/onboarding/presentation/view/username_page.dart';
import '../../features/splash/presentation/view/splash_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      name: AppRoutes.splash,
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      name: AppRoutes.onboarding,
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      name: AppRoutes.login,
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
      pageBuilder: GoTransitions.slide.toLeft.withFade.call,
    ),
    GoRoute(
      name: AppRoutes.otp,
      path: AppRoutes.otp,
      builder: (context, state) => const OtpPage(),
      pageBuilder: GoTransitions.slide.toLeft.withFade.call,
    ),
    GoRoute(
      name: AppRoutes.username,
      path: AppRoutes.username,
      builder: (context, state) => const UsernamePage(),
      pageBuilder: GoTransitions.slide.toLeft.withFade.call,
    ),
    GoRoute(
      name: AppRoutes.birthday,
      path: AppRoutes.birthday,
      builder: (context, state) => const UserBirthdayPage(),
      pageBuilder: GoTransitions.slide.toLeft.withFade.call,
    ),
    GoRoute(
      name: AppRoutes.dashboard,
      path: AppRoutes.dashboard,
      builder: (context, state) => const DashboardPage(),
      pageBuilder: GoTransitions.slide.toLeft.withFade.call,
    ),
  ],
);
