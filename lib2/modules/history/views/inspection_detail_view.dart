import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/responsive.dart';
import '../controllers/inspection_detail_controller.dart';
import '../models/inspection_record_model.dart';

/// Read-only detail for one completed inspection (opened from the History
/// list). Shows the asset ID, then every joint with its inspection cells.
/// Data comes from [InspectionDetailController]; this file is layout only.
class InspectionDetailView extends GetView<InspectionDetailController> {
  const InspectionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Pull the prepared data from the controller (no logic here).
    final record = controller.record;
    final joints = controller.joints;

    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.inspectionDetails),
      body: SafeArea(
        // Scrolls because the joint list can be taller than the screen.
        child: SingleChildScrollView(
          // Centre + cap the width so it reads well on wide tablets.
          child: ResponsiveContainer(
            maxWidth: AppSizes.contentMaxWidth,
            padding: const EdgeInsets.all(AppSizes.padding24),
            // One outlined card wraps the whole detail.
            child: AppCard(
              variant: AppCardVariant.outline,
              padding: const EdgeInsets.all(AppSizes.padding24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Header: POINT NAME label + the asset ID. ──────────────
                  Text(AppStrings.pointName, style: AppTextStyles.fieldLabel),
                  const SizedBox(height: AppSpacing.xs),
                  Text('ID: ${record.assetId}', style: AppTextStyles.h4),
                  const SizedBox(height: AppSpacing.xl),
                  // ── One section per joint, with a gap between them. ────────
                  for (var i = 0; i < joints.length; i++) ...[
                    _JointSection(joint: joints[i]),
                    if (i != joints.length - 1)
                      const SizedBox(height: AppSpacing.xl),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// One joint block: its title (e.g. "Joint 1") above its inspection cells.
class _JointSection extends StatelessWidget {
  final InspectionJoint joint;
  const _JointSection({required this.joint});

  @override
  Widget build(BuildContext context) {
    // Build a cell widget for each inspection entry once, then arrange them.
    final cells = [for (final e in joint.entries) _InspectionCell(entry: e)];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(joint.name, style: AppTextStyles.h4),
        const SizedBox(height: AppSpacing.sm),
        // Responsive: cells sit side-by-side on wide tablets…
        if (context.isWide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < cells.length; i++) ...[
                // Expanded = each cell shares the row width equally.
                Expanded(child: cells[i]),
                // A gap between cells, but not after the last one.
                if (i != cells.length - 1) const SizedBox(width: AppSpacing.md),
              ],
            ],
          )
        // …and stack vertically on narrow phones.
        else
          Column(
            children: [
              for (var i = 0; i < cells.length; i++) ...[
                cells[i],
                if (i != cells.length - 1)
                  const SizedBox(height: AppSpacing.md),
              ],
            ],
          ),
      ],
    );
  }
}

/// A single inspection card: a title, a few text lines, and a photo thumbnail.
class _InspectionCell extends StatelessWidget {
  final InspectionEntry entry;
  const _InspectionCell({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius8),
        border: Border.all(color: AppColors.textPrimary.withValues(alpha: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Inspection 1/2/3" heading.
          Text(entry.title, style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.sm),
          // One muted text row per line in the entry.
          for (final line in entry.lines) ...[
            Text(
              line,
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
          const SizedBox(height: AppSpacing.sm),
          // The inspection photo (falls back to an icon if it fails to load).
          _imagePlaceholder(),
        ],
      ),
    );
  }

  /// The small photo thumbnail. Loads a network image and shows a placeholder
  /// icon if the download fails (offline / bad URL).
  Widget _imagePlaceholder() {
    return Container(
      height: 56,
      width: 96,
      decoration: BoxDecoration(
        color: AppColors.avatarBg,
        borderRadius: BorderRadius.circular(AppSizes.radius4),
      ),
      // Load this entry's photo; show an icon if it fails to load.
      child: Image.network(
        entry.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const Icon(
          Icons.image_outlined,
          color: AppColors.textMuted,
          size: 26,
        ),
      ),
    );
  }
}
