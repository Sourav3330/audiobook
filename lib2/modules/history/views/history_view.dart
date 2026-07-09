import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/app_table.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/forms/forms.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/responsive.dart';
import '../controllers/history_controller.dart';
import '../models/inspection_record_model.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStrings.inspectionManager,
        showBackButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ResponsiveContainer(
            maxWidth: AppSizes.contentMaxWidth,
            padding: const EdgeInsets.all(AppSizes.padding24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(context),
                const SizedBox(height: AppSpacing.lg),
                _tableCard(),
                const SizedBox(height: AppSpacing.md),
                _pagination(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Header: title + search + date filter ───────────────────────────────
  Widget _header(BuildContext context) {
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppStrings.myHistory, style: AppTextStyles.h1),
        const SizedBox(height: AppSpacing.xs),
        Text(AppStrings.historySubtitle, style: AppTextStyles.pageSubtitle),
      ],
    );

    final search = CommonSearchField(
      hintText: AppStrings.searchInspections,
      onChanged: controller.onSearch,
    );

    final dateFilter = _DateFilterButton(onTap: () {});

    if (!context.isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          titleBlock,
          const SizedBox(height: AppSpacing.md),
          search,
          const SizedBox(height: AppSpacing.sm),
          dateFilter,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: titleBlock),
        const SizedBox(width: AppSpacing.md),
        SizedBox(width: 300, child: search),
        const SizedBox(width: AppSpacing.sm),
        dateFilter,
      ],
    );
  }

  // ── Table ───────────────────────────────────────────────────────────────
  Widget _tableCard() {
    return AppCard(
      variant: AppCardVariant.outline,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radius12),
        child: Obx(
          () => AppTable(
            rowPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.lg,
            ),
            headerPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            columns: const [
              TableColumnSpec(AppStrings.assetNameId, flex: 5),
              TableColumnSpec(AppStrings.dateTime, flex: 4),
              TableColumnSpec(
                AppStrings.action,
                flex: 3,
                alignment: Alignment.centerRight,
              ),
            ],
            rows: [
              for (final r in controller.pageRecords) _row(r),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _row(InspectionRecord r) {
    return [
      Text('ID: ${r.assetId}', style: AppTextStyles.bodyLg),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(r.date, style: AppTextStyles.semiBold.copyWith(fontSize: 15)),
          const SizedBox(height: 2),
          Text(r.time, style: AppTextStyles.bodySm),
        ],
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 140),
        child: CommonButton(
          label: AppStrings.viewDetail,
          onPressed: () => controller.openDetail(r),
          height: 44,
          fullWidth: true,
        ),
      ),
    ];
  }

  // ── Pagination ───────────────────────────────────────────────────────────
  Widget _pagination(BuildContext context) {
    return Obx(() {
      final summary = Text(
        AppStrings.showingEntries(
          controller.rangeStart,
          controller.rangeEnd,
          controller.totalEntries,
        ),
        style: AppTextStyles.bodySm,
      );

      final controls = Wrap(
        spacing: AppSpacing.sm,
        children: [
          _PageButton(
            icon: Icons.chevron_left,
            onTap: controller.page.value > 1 ? controller.prevPage : null,
          ),
          for (var p = 1; p <= controller.pageCount; p++)
            _PageButton(
              label: '$p',
              selected: controller.page.value == p,
              onTap: () => controller.goToPage(p),
            ),
          _PageButton(
            icon: Icons.chevron_right,
            onTap: controller.page.value < controller.pageCount
                ? controller.nextPage
                : null,
          ),
        ],
      );

      if (!context.isWide) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            summary,
            const SizedBox(height: AppSpacing.md),
            controls,
          ],
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [summary, controls],
      );
    });
  }
}

class _DateFilterButton extends StatelessWidget {
  final VoidCallback onTap;
  const _DateFilterButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radius8),
      child: Container(
        height: AppSizes.inputHeight,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radius8),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings.allDates, style: AppTextStyles.inputText),
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.calendar_today_outlined,
                size: 18, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;

  const _PageButton({
    this.label,
    this.icon,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    final fg = selected
        ? Colors.white
        : (disabled ? AppColors.textMuted : AppColors.textPrimary);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radius8),
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radius8),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: icon != null
            ? Icon(icon, size: 20, color: fg)
            : Text(
                label ?? '',
                style: AppTextStyles.semiBold.copyWith(color: fg),
              ),
      ),
    );
  }
}
