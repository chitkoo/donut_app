import 'package:donut_app/features/dashboard/presentation/widgets/popular_items_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../configs/constants/app_size.dart';
import '../../../auth/presentation/notifier/auth_session_provider.dart';
import '../widgets/home_header.dart';
import '../widgets/seasonal_items_row.dart';
import '../widgets/slider_label_row.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(
      authSessionProvider.select((session) => session.asData?.value?.user),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(user: user),
          largeVerticalSpace,
          SliderLabelRow(label: "Seasonal Specials"),
          SeasonalItemsRow(),
          SliderLabelRow(label: "Popular 🔥"),
          PopularItemsRow(),
          SizedBox(height: 90),
        ],
      ),
    );
  }
}
