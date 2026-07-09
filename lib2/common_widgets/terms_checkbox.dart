import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';

/// The "I agree to the Terms of Service and Privacy Policy …" row from the
/// registration form — a square checkbox followed by rich text with bold
/// inline links.
class TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onTapTerms;
  final VoidCallback? onTapPrivacy;

  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.onTapTerms,
    this.onTapPrivacy,
  });

  @override
  Widget build(BuildContext context) {
    final linkStyle = AppTextStyles.bodyMd.copyWith(
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: (v) => onChanged(v ?? false),
            activeColor: AppColors.primary,
            side: const BorderSide(color: AppColors.border, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius4),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text.rich(
              TextSpan(
                style: AppTextStyles.bodyMd.copyWith(
                  color: AppColors.textSecondary,
                ),
                children: [
                  const TextSpan(text: AppStrings.agreeTermsPrefix),
                  TextSpan(text: AppStrings.termsOfService, style: linkStyle),
                  const TextSpan(text: AppStrings.and),
                  TextSpan(text: AppStrings.privacyPolicy, style: linkStyle),
                  const TextSpan(text: AppStrings.agreeTermsSuffix),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
