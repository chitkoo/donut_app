import 'package:donut_app/configs/constants/app_size.dart';
import 'package:donut_app/configs/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhoneInput extends HookConsumerWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    // final phoneFocusNode = useFocusNode();

    final phoneNumber = useState('');

    return Container(
      alignment: .center,
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text("+95"),
          smallHorizontalSpace,
          Expanded(
            child: TextFormField(
              controller: phoneController,
              // focusNode: phoneFocusNode,

              keyboardType: TextInputType.phone,
              onChanged: (value) {
                phoneNumber.value = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter phone number',
                border: InputBorder.none,
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
