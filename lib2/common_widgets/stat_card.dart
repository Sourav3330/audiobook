import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import 'app_card.dart';

/// Dashboard summary tile — an uppercase label + trailing icon on top, a large
/// value below, and a coloured footnote. Used for "Inspections Today",
/// "Pending Uploads", "Active Joints".
class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  /// Footnote text below the value (e.g. "vs yesterday", "Waiting for WiFi
  /// sync"). Rendered in the normal text colour.
  final String footnote;

  /// Optional highlighted lead-in shown before [footnote] in [footnoteColor]
  /// and bold (e.g. the "20%" in "↑ 20% vs yesterday"). When null, the whole
  /// footnote uses [footnoteColor].
  final String? footnoteHighlight;

  /// Optional leading glyph for the footnote (e.g. an up-arrow), coloured with
  /// [footnoteColor].
  final IconData? footnoteIcon;

  /// Accent colour for the icon + [footnoteHighlight]. Defaults to muted
  /// secondary.
  final Color footnoteColor;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.footnote,
    this.footnoteHighlight,
    this.footnoteIcon,
    this.footnoteColor = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.outline,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: AppTextStyles.statLabel,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Icon(icon, size: 22, color: AppColors.textPrimary),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(value, style: AppTextStyles.statValue),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              if (footnoteIcon != null) ...[
                Icon(footnoteIcon, size: 15, color: footnoteColor),
                const SizedBox(width: 4),
              ],
              Flexible(child: _footnoteText()),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the footnote: an optional bold coloured [footnoteHighlight] followed
  /// by [footnote] in the normal text colour. Without a highlight, the whole
  /// footnote takes [footnoteColor].
  Widget _footnoteText() {
    if (footnoteHighlight == null) {
      return Text(
        footnote,
        style: AppTextStyles.bodySm.copyWith(color: footnoteColor),
      );
    }
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: footnoteHighlight,
            style: AppTextStyles.bold.copyWith(color: footnoteColor),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: footnote,
            style: AppTextStyles.semiBold
                .copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
