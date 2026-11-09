import 'package:flutter/material.dart';

import '../../../../configs/constants/app_assets.dart';
import '../../../../configs/constants/app_size.dart';
import '../../../../configs/theme/app_theme.dart';
import '../../../../utils/extensions/context_x.dart';

class PopularItemsRow extends StatelessWidget {
  const PopularItemsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: globalHorizontalMargin),
        itemCount: popularItems.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final item = popularItems[index];

          return Column(
            crossAxisAlignment: .start,
            spacing: 5,
            children: [
              Container(
                clipBehavior: .antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(child: ColoredBox(color: Colors.white)),

                    Image.asset(
                      item.image,
                      width: 200,
                      height: 300,
                      fit: BoxFit.contain,
                    ),

                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: .symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.labelBg,
                          borderRadius: BorderRadius.circular(15),
                          border: .all(width: 1, color: AppColors.white),
                        ),
                        child: Text(
                          "${item.promo}% off",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(item.name),
            ],
          );
        },
      ),
    );
  }
}

class PopularItem {
  PopularItem({required this.name, required this.image, required this.promo});

  final String name;
  final String image;
  final int promo;
}

final popularItems = [
  PopularItem(
    name: "Strawberry Chocolate Donuts",
    image: AppAssets.donut,
    promo: 50,
  ),
  PopularItem(
    name: "Strawberry Chocolate Donuts",
    image: AppAssets.donut,
    promo: 20,
  ),
  PopularItem(
    name: "Strawberry Chocolate Donuts",
    image: AppAssets.donut,
    promo: 10,
  ),
];
