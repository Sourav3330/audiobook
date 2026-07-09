import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/settings_tile.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/responsive.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.inspectionSystem,
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: controller.onNotificationsTap,
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ResponsiveContainer(
            maxWidth: AppSizes.formMaxWidth,
            padding: const EdgeInsets.all(AppSizes.padding24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.lg),
                _avatar(),
                const SizedBox(height: AppSpacing.md),
                Obx(
                  () => Text(
                    controller.name.value,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Obx(
                  () => Text(
                    '${controller.role.value} • ID: ${controller.inspectorId.value}',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.pageSubtitle,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                SettingsTile(
                  icon: Icons.badge_outlined,
                  title: AppStrings.personalInformation,
                  onTap: controller.openPersonalInfo,
                ),
                const SizedBox(height: AppSpacing.md),
                SettingsTile(
                  icon: Icons.lock_reset_outlined,
                  title: AppStrings.changePassword,
                  onTap: controller.changePassword,
                ),
                const SizedBox(height: AppSpacing.md),
                SettingsTile(
                  icon: Icons.help_outline,
                  title: AppStrings.helpSupport,
                  onTap: controller.helpSupport,
                ),
                const SizedBox(height: AppSpacing.xl),
                CommonButton(
                  label: AppStrings.logout,
                  icon: Icons.logout,
                  onPressed: controller.logout,
                  fullWidth: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatar() {
    return Center(
      child: Container(
        width: AppSizes.avatarLg,
        height: AppSizes.avatarLg,
        decoration: BoxDecoration(
          color: AppColors.avatarBg,
          borderRadius: BorderRadius.circular(AppSizes.radius16),
        ),
        child: const Icon(
          Icons.person_outline,
          size: 44,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
