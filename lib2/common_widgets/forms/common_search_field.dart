import 'package:flutter/material.dart';

import '../../app/theme/app_decorations.dart';
import '../../app/theme/app_text_styles.dart';
import '../../constants/app_sizes.dart';

/// Search input with a magnifier prefix. Used by the History screen toolbar.
class CommonSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const CommonSearchField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText = 'Search',
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.inputHeight,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: enabled,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: AppTextStyles.inputText,
        decoration: AppInputDecoration.search(hint: hintText),
      ),
    );
  }
}
