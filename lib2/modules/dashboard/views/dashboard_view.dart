import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/app_table.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/section_header.dart';
import '../../../common_widgets/stat_card.dart';
import '../../../common_widgets/status_pill.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/responsive.dart';
import '../controllers/dashboard_controller.dart';
import '../models/joint_progress_model.dart';
import '../models/submission_model.dart';

/// Inspector Dashboard tab — summary stats, the Joint Inspection Progress
/// table, and the Latest Submissions table.
class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: CommonAppBar(
        title: AppStrings.dashboard,
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: controller.onMenuTap,
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      // A plain ListView handles the scroll; the Center + ConstrainedBox sit
      // OUTSIDE the scroll (where height is already bounded), so the content
      // centres and caps its width on wide tablets without any infinite-height
      // shrink-wrap risk.
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: AppSizes.contentMaxWidth),
            child: ListView(
              padding: const EdgeInsets.all(AppSizes.padding24),
              children: [
                _header(context),
                const SizedBox(height: AppSpacing.lg),
                _statCards(context),
                const SizedBox(height: AppSpacing.lg),
                _jointProgressCard(),
                const SizedBox(height: AppSpacing.lg),
                _submissionsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Header: title + subtitle + Export Log ──────────────────────────────
  Widget _header(BuildContext context) {
    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppStrings.inspectorDashboard, style: AppTextStyles.h1),
        const SizedBox(height: AppSpacing.xs),
        Text.rich(
          TextSpan(
            style: AppTextStyles.pageSubtitle,
            children: [
              const TextSpan(text: AppStrings.dashboardSubtitlePrefix),
              TextSpan(
                text: '${controller.scheduledToday} inspections',
                style: AppTextStyles.semiBold,
              ),
              const TextSpan(text: AppStrings.dashboardSubtitleSuffix),
            ],
          ),
        ),
      ],
    );

    final exportBtn = CommonButton(
      label: AppStrings.exportLog,
      icon: Icons.download,
      onPressed: controller.exportLog,
      height: 48,
    );

    if (!context.isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title,
          const SizedBox(height: AppSpacing.md),
          exportBtn,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: title),
        const SizedBox(width: AppSpacing.md),
        exportBtn,
      ],
    );
  }

  // ── Stat cards ─────────────────────────────────────────────────────────
  Widget _statCards(BuildContext context) {
    final cards = <Widget>[
      StatCard(
        label: AppStrings.inspectionsToday,
        value: controller.inspectionsToday.toString().padLeft(2, '0'),
        icon: Icons.fact_check_outlined,
        // Only "20%" (+ arrow) is green; "vs yesterday" stays dark.
        footnoteHighlight: controller.inspectionsTrend,
        footnote: AppStrings.vsYesterday,
        footnoteIcon: Icons.arrow_upward,
        footnoteColor: AppColors.success,
      ),
      StatCard(
        label: AppStrings.pendingUploads,
        value: controller.pendingUploads.toString().padLeft(2, '0'),
        icon: Icons.cloud_upload_outlined,
        footnote: AppStrings.waitingForWifi,
      ),
      StatCard(
        label: AppStrings.activeJoints,
        value: controller.activeJoints.toString().padLeft(2, '0'),
        icon: Icons.account_tree_outlined,
        footnote: AppStrings.acrossProjectSites,
      ),
    ];

    if (!context.isWide) {
      return Column(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            cards[i],
            if (i != cards.length - 1) const SizedBox(height: AppSpacing.md),
          ],
        ],
      );
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            Expanded(child: cards[i]),
            if (i != cards.length - 1) const SizedBox(width: AppSpacing.md),
          ],
        ],
      ),
    );
  }

  // ── Joint inspection progress ──────────────────────────────────────────
  Widget _jointProgressCard() {
    return AppCard(
      variant: AppCardVariant.outline,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader.link(
            title: AppStrings.jointInspectionProgress,
            linkLabel: AppStrings.viewAllActive,
            onTap: controller.viewAllActive,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTable(
            columns: const [
              TableColumnSpec(AppStrings.qrId, flex: 3),
              TableColumnSpec(AppStrings.jobId, flex: 5),
              TableColumnSpec(AppStrings.progress, flex: 6),
              TableColumnSpec(AppStrings.status, flex: 5),
              TableColumnSpec('', flex: 1, alignment: Alignment.centerRight),
            ],
            rows: [
              for (final j in controller.jointProgress) _jointRow(j),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _jointRow(JointProgress j) {
    return [
      Text(j.qrId, style: AppTextStyles.bold.copyWith(fontSize: 15)),
      Text(j.jobId, style: AppTextStyles.bodyMd),
      Row(
        children: [
          Expanded(child: AppProgressBar(value: j.progress)),
          const SizedBox(width: AppSpacing.sm),
          Text('${j.progressPercent}%', style: AppTextStyles.bodySm),
        ],
      ),
      j.isOk ? StatusPill.ok(j.statusLabel) : StatusPill.required(j.statusLabel),
      const Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20),
    ];
  }

  // ── Latest submissions ─────────────────────────────────────────────────
  Widget _submissionsCard() {
    return AppCard(
      variant: AppCardVariant.outline,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader.caption(
            title: AppStrings.latestSubmissions,
            caption: AppStrings.last24Hours,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTable(
            columns: const [
              TableColumnSpec(AppStrings.qrId, flex: 3),
              TableColumnSpec(AppStrings.jobId, flex: 4),
              TableColumnSpec(AppStrings.projectName, flex: 3),
              TableColumnSpec(AppStrings.time, flex: 3),
              TableColumnSpec(
                AppStrings.drawingNo,
                flex: 4,
                alignment: Alignment.centerRight,
              ),
            ],
            rows: [
              for (final s in controller.submissions) _submissionRow(s),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _submissionRow(Submission s) {
    final muted = AppTextStyles.bodySm.copyWith(color: AppColors.textSecondary);
    return [
      Text(s.qrId, style: AppTextStyles.bold.copyWith(fontSize: 15)),
      Text(s.jobId, style: muted),
      Text(s.projectName, style: muted),
      Text(s.time, style: muted),
      Text(s.drawingNo, style: muted, textAlign: TextAlign.right),
    ];
  }
}
