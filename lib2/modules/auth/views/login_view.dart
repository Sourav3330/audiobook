import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/auth_footer.dart';
import '../../../common_widgets/auth_scaffold.dart';
import '../../../common_widgets/brand_logo.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/forms/forms.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/validators.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Form(
        key: controller.loginKey,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: BrandLogo()),
              const SizedBox(height: AppSpacing.lg),
              Text(
                AppStrings.loginTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.brandTitle,
              ),
              const SizedBox(height: AppSpacing.xl),
              CommonTextFormField(
                label: AppStrings.emailOrInspectorId,
                controller: controller.loginCredential,
                hintText: AppStrings.enterCredentials,
                validator: Validators.credential,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.username],
              ),
              const SizedBox(height: AppSpacing.md),
              CommonPasswordField(
                hintText: AppStrings.passwordHint,
                label: AppStrings.password,
                controller: controller.loginPassword,
                validator: Validators.password,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.password],
                onFieldSubmitted: (_) => controller.login(),
              ),
              const SizedBox(height: AppSpacing.md),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: controller.forgotPassword,
                  child: Text(
                    AppStrings.forgotPassword,
                    style: AppTextStyles.semiBold.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Obx(
                () => CommonButton(
                  label: AppStrings.login.toUpperCase(),
                  onPressed: controller.login,
                  isLoading: controller.isLoading.value,
                  fullWidth: true,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AuthFooter(
                prompt: AppStrings.dontHaveAccount,
                actionLabel: AppStrings.signUp,
                onTap: controller.goToSignup,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
