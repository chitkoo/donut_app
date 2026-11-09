import 'package:donut_app/configs/theme/app_theme.dart';
import 'package:donut_app/utils/extensions/context_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    super.key,
    required this.controller,
    required this.placeholderText,
    required this.onChanged,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String placeholderText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      // margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        maxLength: 50,
        controller: controller,
        keyboardType: TextInputType.name,
        onChanged: onChanged,
        inputFormatters:
            inputFormatters ??
            [
              // FilteringTextInputFormatter.deny(
              //   RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
              // ),
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z\u1000-\u109F\uAA60-\uAA7F\uA9E0-\uA9FF\s]'),
              ),
            ],
        decoration: InputDecoration(
          counterText: "",
          hintText: placeholderText,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.gray,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
