import 'package:donut_app/configs/theme/app_theme.dart';
import 'package:donut_app/utils/extensions/context_x.dart';
import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    super.key,
    required this.value,
    required this.onTap,
    required this.placeholderText,
  });

  final String value;
  final Function()? onTap;
  final String placeholderText;

  @override
  Widget build(BuildContext context) {
    final textColor = value.isEmpty ? AppColors.gray : AppColors.text;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: .centerLeft,
        // margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          value.isEmpty ? placeholderText : value,
          style: context.textTheme.bodyLarge?.copyWith(color: textColor),
        ),
        // child: TextFormField(
        //   controller: controller,
        //   keyboardType: TextInputType.name,
        //   // onChanged: (value) {
        //   //   phoneNumber.value = value;
        //   // },
        //   decoration: InputDecoration(
        //     hintText: placeholderText,
        //     border: InputBorder.none,
        //     enabledBorder: InputBorder.none,
        //     focusedBorder: InputBorder.none,
        //     errorBorder: InputBorder.none,
        //     focusedErrorBorder: InputBorder.none,
        //     disabledBorder: InputBorder.none,
        //   ),
        // ),
      ),
    );
  }
}
