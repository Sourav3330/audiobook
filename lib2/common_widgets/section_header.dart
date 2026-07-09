import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_sizes.dart';

/// A card section header — an uppercase title on the left and an optional
/// trailing action (e.g. "View All Active", "Last 24 Hours"). Used at the top
/// of the dashboard's table cards.
class SectionHeader extends StatelessWidget {
  final String title;

  /// Optional trailing widget — a tappable link or muted caption.
  final Widget? trailing;

  const SectionHeader({super.key, required this.title, this.trailing});

  /// Convenience for a tappable text link on the right.
  factory SectionHeader.link({
    Key? key,
    required String title,
    required String linkLabel,
    VoidCallback? onTap,
  }) {
    return SectionHeader(
      key: key,
      title: title,
      trailing: _LinkText(label: linkLabel, onTap: onTap),
    );
  }

  /// Convenience for a muted caption on the right.
  factory SectionHeader.caption({
    Key? key,
    required String title,
    required String caption,
  }) {
    return SectionHeader(
      key: key,
      title: title,
      trailing: Text(caption, style: AppTextStyles.bodySm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Text(title.toUpperCase(), style: AppTextStyles.sectionLabel)),
        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.sm),
          trailing!,
        ],
      ],
    );
  }
}

class _LinkText extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _LinkText({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyles.semiBold.copyWith(color: Colors.black),
      ),
    );
  }
}
