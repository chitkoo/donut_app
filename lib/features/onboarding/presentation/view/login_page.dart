import 'package:donut_app/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/constants/app_size.dart';
import '../../../../shared/widgets/donut_app_button.dart';
import '../../../../shared/widgets/donut_app_scaffold.dart';
import '../../../../utils/extensions/context_x.dart';
import 'widgets/onboard_back_button.dart';
import 'widgets/phone_input.dart';
import 'widgets/terms_and_condition_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DonutAppScaffold(
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  OnboardBackButton(),
                  //  CircularProgressIndicator()
                ],
              ),
              veryLargeVerticalSpace,
              Align(
                alignment: .centerLeft,
                child: Text(
                  "Enter your phone number",
                  style: context.textTheme.headlineLarge?.copyWith(
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              PhoneInput(),
            ],
          ),
          DonutAppButton(
            width: double.infinity,
            text: "continue",
            onPressed: () {
              context.pushNamed(AppRoutes.otp);
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: TermsAndConditionText(),
      ),
    );
  }
}
