import 'package:flutter/material.dart';

import '../../../../configs/constants/app_size.dart';
import '../../../../shared/widgets/donut_app_scaffold.dart';
import '../../../../utils/extensions/context_x.dart';
import 'widgets/onboard_back_button.dart';
import 'widgets/terms_and_condition_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
                  "Verify your number",
                  style: context.textTheme.headlineLarge?.copyWith(
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              mediumVerticalSpace,
              Align(
                alignment: .centerLeft,
                child: Text(
                  "We've sent 6 digits OTP to +959000001000.",
                  style: context.textTheme.bodyMedium?.copyWith(),
                ),
              ),
            ],
          ),
          // DonutAppButton(
          //   width: double.infinity,
          //   text: "continue",
          //   onPressed: () {},
          // ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: TermsAndConditionText(),
      ),
    );
  }
}
