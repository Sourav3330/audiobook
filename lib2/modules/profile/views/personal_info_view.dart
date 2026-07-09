import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../common_widgets/labeled_value.dart';
import '../../../common_widgets/section_header.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/responsive.dart';
import '../../auth/models/inspector_user.dart';
import '../controllers/personal_info_controller.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: const CommonAppBar(title: AppStrings.personalInformation),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }
          if (controller.error.value.isNotEmpty) {
            return _ErrorState(
              message: controller.error.value,
              onRetry: controller.load,
            );
          }
          final user = controller.user.value;
          if (user == null) {
            return _ErrorState(
              message: AppStrings.couldNotLoadProfile,
              onRetry: controller.load,
            );
          }
          return Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: AppSizes.formMaxWidth),
              child: ListView(
                padding: const EdgeInsets.all(AppSizes.padding24),
                children: [
                  _headerCard(user),
                  const SizedBox(height: AppSpacing.lg),
                  _section(context, AppStrings.accountDetails, [
                    (label: AppStrings.fullName, value: user.fullName),
                    (label: AppStrings.email, value: user.email),
                    (label: AppStrings.roleLabel, value: _titleCase(user.role)),
                    (label: AppStrings.position, value: user.position),
                    (label: AppStrings.phoneNumber, value: user.phone),
                    (label: AppStrings.landlineNumber, value: user.landline),
                  ]),
                  const SizedBox(height: AppSpacing.lg),
                  _section(context, AppStrings.companyDetails, [
                    (label: AppStrings.companyName, value: user.companyName),
                    (label: AppStrings.companyId, value: user.companyId),
                    (label: AppStrings.state, value: user.state),
                    (
                      label: AppStrings.companyAddress,
                      value: user.companyAddress
                    ),
                  ]),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── Header: avatar + name + role ───────────────────────────────────────
  Widget _headerCard(InspectorUser user) {
    final displayName =
        user.fullName.isEmpty ? AppStrings.userName : user.fullName;
    return AppCard(
      variant: AppCardVariant.outline,
      child: Row(
        children: [
          Container(
            width: AppSizes.avatarLg,
            height: AppSizes.avatarLg,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppSizes.radius16),
            ),
            child: const Icon(Icons.person_outline,
                size: 40, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(displayName, style: AppTextStyles.h3),
                const SizedBox(height: AppSpacing.xs),
                _roleChip(_titleCase(user.role)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _roleChip(String role) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppSizes.radius24),
      ),
      child: Text(
        role.isEmpty ? 'Inspector' : role,
        style: AppTextStyles.semiBold.copyWith(color: AppColors.primary),
      ),
    );
  }

  // ── A titled card of label/value fields ────────────────────────────────
  Widget _section(
    BuildContext context,
    String title,
    List<({String label, String? value})> fields,
  ) {
    return AppCard(
      variant: AppCardVariant.outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(title: title),
          const SizedBox(height: AppSpacing.lg),
          _grid(context, fields),
        ],
      ),
    );
  }

  Widget _grid(
    BuildContext context,
    List<({String label, String? value})> fields,
  ) {
    Widget cell(({String label, String? value}) f) {
      final v = (f.value == null || f.value!.trim().isEmpty)
          ? AppStrings.notProvided
          : f.value!.trim();
      return LabeledValue(label: f.label, value: v);
    }

    // Single column on phones.
    if (!context.isWide) {
      return Column(
        children: [
          for (var i = 0; i < fields.length; i++) ...[
            cell(fields[i]),
            if (i != fields.length - 1)
              const SizedBox(height: AppSpacing.lg),
          ],
        ],
      );
    }

    // Two columns on tablet/desktop.
    final rows = <Widget>[];
    for (var i = 0; i < fields.length; i += 2) {
      final left = fields[i];
      final right = i + 1 < fields.length ? fields[i + 1] : null;
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: cell(left)),
            const SizedBox(width: AppSpacing.xl),
            Expanded(
              child: right == null ? const SizedBox.shrink() : cell(right),
            ),
          ],
        ),
      );
      if (i + 2 < fields.length) {
        rows.add(const SizedBox(height: AppSpacing.lg));
      }
    }
    return Column(children: rows);
  }

  String _titleCase(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.padding24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline,
                size: 44, color: AppColors.textMuted),
            const SizedBox(height: AppSpacing.md),
            Text(message, textAlign: TextAlign.center, style: AppTextStyles.bodyMd),
            const SizedBox(height: AppSpacing.md),
            TextButton(onPressed: onRetry, child: const Text(AppStrings.retry)),
          ],
        ),
      ),
    );
  }
}
