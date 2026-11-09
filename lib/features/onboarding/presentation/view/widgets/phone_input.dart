import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../configs/constants/app_size.dart';
import '../../../../../configs/theme/app_theme.dart';
import '../../../../../utils/extensions/context_x.dart';

class PhoneInput extends HookConsumerWidget {
  const PhoneInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final phoneController = useTextEditingController();
    // final phoneFocusNode = useFocusNode();

    // final phoneNumber = useState('');

    return Container(
      alignment: .center,
      // margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text("+95", style: context.textTheme.bodyLarge),
          smallHorizontalSpace,
          Expanded(
            child: TextFormField(
              controller: controller,
              // focusNode: phoneFocusNode,

              keyboardType: TextInputType.phone,
              onChanged: onChanged,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
              decoration: InputDecoration(
                hintText: 'Enter phone number',
                border: InputBorder.none,
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.gray,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
