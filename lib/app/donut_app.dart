import 'package:flutter/material.dart';

import '../configs/theme/app_theme.dart';
import '../core/router/app_router.dart';

class DonutApp extends StatelessWidget {
  const DonutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "J'Donuts App",
      theme: AppTheme.light,
      routerConfig: appRouter,
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: mediaQuery.textScaler.clamp(
              minScaleFactor: 1.0,
              maxScaleFactor: 1.3,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
