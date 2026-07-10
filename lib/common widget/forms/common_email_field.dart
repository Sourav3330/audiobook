import 'package:audio_book/common%20widget/forms/common_pass_field.dart';
import 'package:audio_book/common%20widget/forms/common_text_field.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonEmailField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FormFieldValidator validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CommonEmailField({
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
      label: AppStrings.emailFieldLabel.toUpperCase(),
      hintText: AppStrings.emailFieldHint,
      controller: controller,
      textInputAction: textInputAction,
      focusNode: focusNode,
      suffixIcon: suffixIcon,
      validator: validator,

    );
  }
}
