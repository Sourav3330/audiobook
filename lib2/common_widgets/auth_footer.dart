import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// The footer shown beneath the auth forms — an optional top divider, a muted
/// prompt, and a tappable bold action ("Sign Up" / "Log In" / "Sign In").
class AuthFooter extends StatelessWidget {
  final String prompt;
  final String actionLabel;
  final VoidCallback onTap;
  final bool showDivider;

  const AuthFooter({
    super.key,
    required this.prompt,
    required this.actionLabel,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider) ...[
          const Divider(color: AppColors.divider, height: 1),
          const SizedBox(height: AppSpacing.lg),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              prompt,
              style: AppTextStyles.bodyMd.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 4),
            InkWell(
              onTap: onTap,
              child: Text(actionLabel, style: AppTextStyles.link),
            ),
          ],
        ),
      ],
    );
  }
}
