import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/auth_footer.dart';
import '../../../common_widgets/auth_scaffold.dart';
import '../../../common_widgets/brand_logo.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/forms/forms.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/responsive.dart';
import '../../../helpers/validators.dart';
import '../controllers/auth_controller.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      maxWidth: AppSizes.authMaxWidth + 60,
      child: Form(
        key: controller.signupKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: BrandLogo(icon: Icons.assignment_turned_in_outlined)),
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.signupTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.brandTitle,
            ),
            const SizedBox(height: AppSpacing.xl),
            // First + Last name share a row on wide screens, stack on phones.
            _nameRow(context),
            const SizedBox(height: AppSpacing.md),
            CommonEmailField(
              label: AppStrings.email,
              controller: controller.signupEmail,
              hintText: AppStrings.hintInspectorEmail,
            ),
            const SizedBox(height: AppSpacing.md),
            CommonPasswordField(
              label: AppStrings.password,
              hintText: AppStrings.passwordHint,
              controller: controller.signupPassword,
              validator: Validators.password,
            ),
            const SizedBox(height: AppSpacing.md),
            CommonPasswordField(
              label: AppStrings.confirmPassword,
              hintText: AppStrings.passwordHint,
              controller: controller.signupConfirmPassword,
              validator: (v) =>
                  Validators.confirmPassword(v, controller.signupPassword.text),
            ),
            const SizedBox(height: AppSpacing.xl),
            Obx(
              () => CommonButton(
                label: AppStrings.createAccount.toUpperCase(),
                onPressed: controller.createAccount,
                isLoading: controller.isLoading.value,
                fullWidth: true,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            AuthFooter(
              prompt: AppStrings.alreadyHaveAccount,
              actionLabel: AppStrings.logIn,
              onTap: controller.goToLogin,
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameRow(BuildContext context) {
    final firstName = CommonTextFormField(
      label: AppStrings.firstName,
      controller: controller.signupFirstName,
      hintText: AppStrings.hintJohn,
      validator: Validators.name,
      textCapitalization: TextCapitalization.words,
    );
    final lastName = CommonTextFormField(
      label: AppStrings.lastName,
      controller: controller.signupLastName,
      hintText: AppStrings.hintDoe,
      validator: Validators.name,
      textCapitalization: TextCapitalization.words,
    );

    if (!context.isWide) {
      return Column(
        children: [
          firstName,
          const SizedBox(height: AppSpacing.md),
          lastName,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: firstName),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: lastName),
      ],
    );
  }
}
