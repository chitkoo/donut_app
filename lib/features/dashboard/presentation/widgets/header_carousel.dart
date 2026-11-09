import 'package:flutter/material.dart';

import '../../../../configs/constants/app_assets.dart';
import '../../../../configs/constants/app_size.dart';
import '../../../../configs/theme/app_theme.dart';
import '../../../../utils/extensions/context_x.dart';

class HeaderCarousel extends StatelessWidget {
  const HeaderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        padEnds: false,
        controller: PageController(viewportFraction: 0.8),
        itemCount: homePromotion.length,
        itemBuilder: (context, index) {
          final item = homePromotion[index];
          return Padding(
            padding: EdgeInsets.only(
              right: 16,
              left: index == 0 ? globalHorizontalMargin : 0,
            ),
            child: Stack(
              alignment: .center,
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: item.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: .symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.labelBg,
                      borderRadius: BorderRadius.circular(15),
                      border: .all(width: 1, color: AppColors.white),
                    ),
                    child: Text(
                      item.title,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      item.label,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: .bold,
                      ),
                      textAlign: .center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  child: Container(
                    clipBehavior: .antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: .circular(20),
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    child: Image.asset(
                      width: 180,
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final homePromotion = [
  HomePromotion(
    title: "New shop",
    label: "We are now at Central Boulevard",
    backgroundColor: AppColors.purple,
    image: AppAssets.donutShop,
  ),
  HomePromotion(
    title: "New shop",
    label: "We are now at Central Boulevard",
    backgroundColor: AppColors.button,
    image: AppAssets.donutShop,
  ),
  HomePromotion(
    title: "New shop",
    label: "We are now at Central Boulevard",
    backgroundColor: AppColors.progress,
    image: AppAssets.donutShop,
  ),
];

class HomePromotion {
  const HomePromotion({
    required this.label,
    required this.title,
    required this.backgroundColor,
    required this.image,
  });

  final String label;
  final String title;
  final Color backgroundColor;
  final String image;
}
