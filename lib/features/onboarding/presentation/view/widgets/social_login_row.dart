import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../configs/constants/app_assets.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = 25.0;

    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        SvgPicture.asset(
          AppAssets.google,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          AppAssets.apple,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          AppAssets.facebook,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
