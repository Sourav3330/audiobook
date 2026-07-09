import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// A tappable row used on the Profile screen — leading icon, title, trailing
/// chevron, wrapped in a bordered white card.
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.radius8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radius8),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.padding20,
            vertical: AppSizes.padding20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radius8),
            border: Border.all(color: AppColors.divider),
          ),
          child: Row(
            children: [
              Icon(icon, size: 24, color: AppColors.textPrimary),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(title, style: AppTextStyles.h4),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
