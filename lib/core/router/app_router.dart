// final GoRouter appRouter = GoRouter(
//   initialLocation: AppRoutes.onboarding,
//   routes: [
//     GoRoute(
//       name: AppRoutes.splash,
//       path: AppRoutes.splash,
//       builder: (context, state) => const SplashPage(),
//     ),

//     GoRoute(
//       name: AppRoutes.onboarding,
//       path: AppRoutes.onboarding,
//       builder: (context, state) => const OnboardingPage(),
//     ),
//     GoRoute(
//       name: AppRoutes.login,
//       path: AppRoutes.login,
//       builder: (context, state) => const LoginPage(),
//       pageBuilder: GoTransitions.slide.toLeft.withFade.call,
//     ),
//     GoRoute(
//       name: AppRoutes.otp,
//       path: AppRoutes.otp,
//       builder: (context, state) => const OtpPage(),
//       pageBuilder: GoTransitions.slide.toLeft.withFade.call,
//     ),
//     GoRoute(
//       name: AppRoutes.username,
//       path: AppRoutes.username,
//       builder: (context, state) => const UsernamePage(),
//       pageBuilder: GoTransitions.slide.toLeft.withFade.call,
//     ),
//     GoRoute(
//       name: AppRoutes.birthday,
//       path: AppRoutes.birthday,
//       builder: (context, state) => const UserBirthdayPage(),
//       pageBuilder: GoTransitions.slide.toLeft.withFade.call,
//     ),
//     GoRoute(
//       name: AppRoutes.dashboard,
//       path: AppRoutes.dashboard,
//       builder: (context, state) => const DashboardPage(),
//       pageBuilder: GoTransitions.slide.toLeft.withFade.call,
//     ),
//   ],
// );

import 'package:donut_app/features/dashboard/presentation/view/home_page.dart';
import 'package:donut_app/features/dashboard/presentation/view/reward_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/notifier/auth_session_provider.dart';
import '../../features/dashboard/presentation/dashboard_scaffold.dart';
import '../../features/dashboard/presentation/view/settings_page.dart' show SettingsPage;
import '../../features/onboarding/presentation/view/login_page.dart';
import '../../features/onboarding/presentation/view/onboarding_page.dart';
import '../../features/onboarding/presentation/view/otp_page.dart';
import '../../features/onboarding/presentation/view/user_birthday_page.dart';
import '../../features/onboarding/presentation/view/username_page.dart';
import '../../features/splash/presentation/view/splash_page.dart';
import 'app_routes.dart';
import 'auth_redirect.dart';
import 'router_refresh_notifier.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ref.watch(routerRefreshProvider);

  final router = GoRouter(
    initialLocation: AppRoutePaths.splash,
    refreshListenable: refreshNotifier,

    redirect: (context, state) {
      return authRedirect(
        session: ref.read(authSessionProvider),
        location: state.matchedLocation,
      );
    },

    routes: [
      GoRoute(
        path: AppRoutePaths.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutePaths.onboarding,
        name: AppRouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutePaths.login,
        name: AppRouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutePaths.otp,
        name: AppRouteNames.otp,
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: AppRoutePaths.username,
        name: AppRouteNames.username,
        builder: (context, state) => const UsernamePage(),
      ),
      GoRoute(
        path: AppRoutePaths.birthday,
        name: AppRouteNames.birthday,
        builder: (context, state) => const UserBirthdayPage(),
      ),
      // GoRoute(
      //   path: AppRoutePaths.dashboard,
      //   name: AppRouteNames.dashboard,
      //   builder: (context, state) => const DashboardPage(),
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.home,
                name: AppRouteNames.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.reward,
                name: AppRouteNames.reward,
                builder: (context, state) => const RewardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.setting,
                name: AppRouteNames.setting,
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
});
