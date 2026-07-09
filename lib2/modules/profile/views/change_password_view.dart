import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/forms/forms.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/validators.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: const CommonAppBar(title: AppStrings.changePassword),
      body: SafeArea(
        // Center vertically + horizontally; SingleChildScrollView keeps it
        // usable when the keyboard shrinks the space.
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.padding24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSizes.authMaxWidth),
              child: AppCard(
                variant: AppCardVariant.outline,
                child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          AppStrings.changePasswordSubtitle,
                          style: AppTextStyles.bodySm,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        CommonPasswordField(
                          label: AppStrings.currentPassword,
                          hintText: AppStrings.passwordHint,
                          controller: controller.currentPassword,
                          validator: Validators.required,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        CommonPasswordField(
                          label: AppStrings.newPassword,
                          hintText: AppStrings.passwordHint,
                          controller: controller.newPassword,
                          validator: Validators.password,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        CommonPasswordField(
                          label: AppStrings.confirmNewPassword,
                          hintText: AppStrings.passwordHint,
                          controller: controller.confirmPassword,
                          validator: (v) => Validators.confirmPassword(
                            v,
                            controller.newPassword.text,
                          ),
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => controller.submit(),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Obx(
                          () => CommonButton(
                            label: AppStrings.updatePassword,
                            onPressed: controller.submit,
                            isLoading: controller.isLoading.value,
                            fullWidth: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
