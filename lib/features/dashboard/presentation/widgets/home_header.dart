import 'package:flutter/material.dart';

import '../../../../configs/constants/app_assets.dart';
import '../../../../configs/constants/app_size.dart';
import '../../../../configs/theme/app_theme.dart';
import '../../../../utils/extensions/context_x.dart';
import '../../../onboarding/domain/entities/user.dart';
import 'header_carousel.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: AppColors.homeHeaderBg,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.labelBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  border: .fromLTRB(
                    left: BorderSide(width: 3, color: AppColors.white),
                    right: BorderSide.none,
                    top: BorderSide(width: 3, color: AppColors.white),
                    bottom: BorderSide(width: 3, color: AppColors.white),
                  ),
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.notifications_outlined, color: Colors.white),
                    Container(
                      width: 18,
                      height: 18,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: .circle,
                      ),
                      alignment: .center,
                      child: Text(
                        '10',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: .start,
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: globalHorizontalMargin,
                  ),
                  child: Row(
                    crossAxisAlignment: .start,
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                            AppAssets.defaultUserPhoto,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user?.fullName}",
                              style: context.textTheme.headlineLarge,
                            ),
                            Text(
                              'Bronze member',
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: globalHorizontalMargin,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: .circular(20),
                  ),
                  child: Text(
                    "1000 points left to become Gold Member",
                    style: context.textTheme.bodySmall,
                  ),
                ),
                HeaderCarousel(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
