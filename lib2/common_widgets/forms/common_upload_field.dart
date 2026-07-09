import 'package:flutter/material.dart';

import '../../app/theme/app_text_styles.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

/// Labelled file-picker field — a tappable box showing the chosen file name (or
/// a placeholder) with a trailing upload icon. Used for the Qualification
/// Certificate input on the registration form.
class CommonUploadField extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? fileName;
  final VoidCallback? onTap;

  const CommonUploadField({
    super.key,
    required this.label,
    this.placeholder = 'Upload',
    this.fileName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasFile = fileName != null && fileName!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label.toUpperCase(), style: AppTextStyles.fieldLabel),
          const SizedBox(height: AppSpacing.sm),
        ],
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSizes.radius8),
          child: Container(
            height: AppSizes.inputHeight,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding16),
            decoration: BoxDecoration(
              color: AppColors.inputFill,
              borderRadius: BorderRadius.circular(AppSizes.radius8),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    hasFile ? fileName! : placeholder,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: hasFile
                        ? AppTextStyles.inputText
                        : AppTextStyles.placeholder,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                const Icon(
                  Icons.file_upload_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
