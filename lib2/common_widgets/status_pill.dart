import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// Inline status indicator — a small leading icon + coloured label. Used in the
/// dashboard's Joint Inspection Progress table ("Insp 2 OK" / "Insp 2 REQ").
class StatusPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const StatusPill({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  /// A positive / pass status — green check.
  const StatusPill.ok(this.label, {super.key})
      : icon = Icons.check_circle_outline,
        color = AppColors.success;

  /// An action-required / warning status — red triangle.
  const StatusPill.required(this.label, {super.key})
      : icon = Icons.warning_amber_rounded,
        color = AppColors.error;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.semiBold.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

/// Thin rounded progress bar used in the dashboard table.
class AppProgressBar extends StatelessWidget {
  /// 0.0–1.0.
  final double value;
  final double height;

  const AppProgressBar({super.key, required this.value, this.height = 8});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radius8),
      child: LinearProgressIndicator(
        value: value.clamp(0.0, 1.0),
        minHeight: height,
        backgroundColor: AppColors.progressTrack,
        valueColor: const AlwaysStoppedAnimation(AppColors.primary),
      ),
    );
  }
}
