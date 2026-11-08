import 'package:flutter/material.dart';

import '../../../../utils/extensions/context_x.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              "Round food for every mood",
              style: context.textTheme.headlineLarge,
            ),

            Text(
              "Already have an account",
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
