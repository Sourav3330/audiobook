import 'package:flutter/material.dart';

import '../../app/theme/app_decorations.dart';
import '../../app/theme/app_text_styles.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

/// Canonical dropdown for the Inspector app. Wraps [DropdownButtonFormField] so
/// the control participates in `Form` validation.
class CommonDropdownField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  final String? label;
  final String? hintText;
  final String? errorText;

  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;

  final bool enabled;
  final bool isExpanded;

  const CommonDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
    this.hintText,
    this.errorText,
    this.validator,
    this.autovalidateMode,
    this.enabled = true,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty) ...[
          Text(label!.toUpperCase(), style: AppTextStyles.fieldLabel),
          const SizedBox(height: AppSpacing.sm),
        ],
        DropdownButtonFormField<T>(
          initialValue: value,
          items: items,
          onChanged: enabled ? onChanged : null,
          validator: validator,
          autovalidateMode: autovalidateMode,
          isExpanded: isExpanded,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          style: AppTextStyles.inputText,
          dropdownColor: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radius8),
          hint: hintText == null
              ? null
              : Text(hintText!, style: AppTextStyles.placeholder),
          decoration: AppInputDecoration.textField(errorText: errorText),
        ),
      ],
    );
  }
}
