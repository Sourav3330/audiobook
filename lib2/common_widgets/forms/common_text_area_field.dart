import 'package:flutter/material.dart';

import '../../app/theme/app_decorations.dart';
import '../../app/theme/app_text_styles.dart';
import '../../constants/app_sizes.dart';

/// Multi-line text input — used for the Company Address field.
class CommonTextAreaField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? hintText;
  final String? helperText;
  final String? errorText;

  final int minLines;
  final int maxLines;
  final int? maxLength;

  final String? Function(String?)? validator;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  const CommonTextAreaField({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.helperText,
    this.errorText,
    this.minLines = 3,
    this.maxLines = 6,
    this.maxLength,
    this.validator,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label.toUpperCase(), style: AppTextStyles.fieldLabel),
          const SizedBox(height: AppSpacing.sm),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          enabled: enabled,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          onChanged: onChanged,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.inputText,
          decoration: AppInputDecoration.textField(
            hint: hintText,
            helperText: helperText,
            errorText: errorText,
            counterText: maxLength == null ? '' : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
