import 'package:flutter/material.dart';

import '../../../../configs/constants/app_assets.dart';
import '../../../../configs/constants/app_size.dart';
import '../../../../configs/theme/app_theme.dart';
import '../../../../utils/extensions/context_x.dart';

class SeasonalItemsRow extends StatelessWidget {
  const SeasonalItemsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: globalHorizontalMargin),
        itemCount: seasonalSpecialItems.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final item = seasonalSpecialItems[index];

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
                    Image.asset(
                      item.image,
                      width: 220,
                      height: 150,
                      fit: BoxFit.cover,
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

class SeasonalItem {
  SeasonalItem({required this.name, required this.image, required this.promo});

  final String name;
  final String image;
  final int promo;
}

final seasonalSpecialItems = [
  SeasonalItem(
    name: "Mistletoe Romance Box",
    image: AppAssets.donutbox,
    promo: 50,
  ),
  SeasonalItem(
    name: "Mistletoe Romance Box",
    image: AppAssets.donutbox,
    promo: 20,
  ),
  SeasonalItem(
    name: "Mistletoe Romance Box",
    image: AppAssets.donutbox,
    promo: 10,
  ),
];
