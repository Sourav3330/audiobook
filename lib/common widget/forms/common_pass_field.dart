import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import 'common_text_field.dart';

class CommonPassField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FormFieldValidator validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CommonPassField({
    super.key,
    required this.controller,
    required this.textInputAction,
    required this.validator,
    required this.focusNode,
     this.prefixIcon,
     this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      prefixIcon: prefixIcon,
      label: AppStrings.passLabel.toUpperCase(),
      hintText: AppStrings.paasHint,
      controller: controller,
      textInputAction: textInputAction,
      focusNode: focusNode,
      suffixIcon: suffixIcon,
      validator: validator,
    );
  }
}
