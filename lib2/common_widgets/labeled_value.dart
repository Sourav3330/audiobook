import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';

/// Label-above-value pair used inside cards and detail rows. A small uppercase
/// label on top + a heavier value below.
class LabeledValue extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final TextStyle? valueStyle;

  /// When `true`, lay out as a horizontal row (label left, value right).
  final bool inline;

  const LabeledValue({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
    this.valueStyle,
    this.inline = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelText = Text(label.toUpperCase(), style: AppTextStyles.fieldLabel);
    final valueText = Text(
      value,
      style: valueStyle ??
          AppTextStyles.semiBold.copyWith(
            color: valueColor ?? AppColors.textPrimary,
          ),
    );

    if (inline) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [labelText, valueText],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [labelText, const SizedBox(height: 2), valueText],
    );
  }
}
