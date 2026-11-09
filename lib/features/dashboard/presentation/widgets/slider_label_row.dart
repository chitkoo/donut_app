import 'package:donut_app/utils/extensions/context_x.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/configs/constants/app_size.dart';

class SliderLabelRow extends StatelessWidget {
  const SliderLabelRow({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: globalHorizontalMargin,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.titleLarge?.copyWith(fontWeight: .bold),
          ),
          Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(color: Colors.white, shape: .circle),
            alignment: .center,
            child: Icon(Icons.chevron_right, size: 18),
          ),
        ],
      ),
    );
  }
}
