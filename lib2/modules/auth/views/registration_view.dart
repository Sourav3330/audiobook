import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/auth_footer.dart';
import '../../../common_widgets/auth_scaffold.dart';
import '../../../common_widgets/brand_logo.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/forms/forms.dart';
import '../../../common_widgets/terms_checkbox.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../helpers/responsive.dart';
import '../../../helpers/validators.dart';
import '../controllers/auth_controller.dart';

class RegistrationView extends GetView<AuthController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      maxWidth: AppSizes.formMaxWidth,
      child: Form(
        key: controller.registrationKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: BrandLogo(icon: Icons.assignment_turned_in_outlined)),
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.registrationTitle.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTextStyles.brandTitle.copyWith(letterSpacing: 0.5),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              AppStrings.registrationSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.pageSubtitle,
            ),
            const SizedBox(height: AppSpacing.xl),

            _twoCol(
              context,
              CommonTextFormField(
                label: AppStrings.firstName,
                controller: controller.regFirstName,
                hintText: AppStrings.hintFirstName,
                validator: Validators.name,
                textCapitalization: TextCapitalization.words,
              ),
              CommonTextFormField(
                label: AppStrings.lastName,
                controller: controller.regLastName,
                hintText: AppStrings.hintLastName,
                validator: Validators.name,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _twoCol(
              context,
              CommonTextFormField(
                label: AppStrings.position,
                controller: controller.regPosition,
                hintText: AppStrings.hintPosition,
                validator: Validators.required,
                textCapitalization: TextCapitalization.words,
              ),
              CommonEmailField(
                label: AppStrings.emailAddress,
                controller: controller.regEmail,
                hintText: AppStrings.hintAdminEmail,
                // Carried over from signup — locked so it can't drift from the
                // account being created.
                readOnly: true,
                helperText: 'From your signup — not editable here',
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _twoCol(
              context,
              CommonTextFormField(
                label: AppStrings.landlineNumber,
                controller: controller.regLandline,
                hintText: AppStrings.hintPhone,
                keyboardType: TextInputType.phone,
              ),
              CommonTextFormField(
                label: AppStrings.phoneNumber,
                controller: controller.regPhone,
                hintText: AppStrings.hintPhone,
                keyboardType: TextInputType.phone,
                validator: Validators.phone,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _twoCol(
              context,
              CommonTextFormField(
                label: AppStrings.companyName,
                controller: controller.regCompanyName,
                hintText: AppStrings.hintLegalEntity,
                validator: Validators.required,
              ),
              CommonTextFormField(
                label: AppStrings.companyId,
                controller: controller.regCompanyId,
                hintText: AppStrings.hintRegistryId,
                validator: Validators.required,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _twoCol(
              context,
              Obx(
                () => CommonDropdownField<String>(
                  label: AppStrings.state,
                  hintText: AppStrings.selectState,
                  value: controller.regState.value,
                  items: [
                    for (final s in AuthController.states)
                      DropdownMenuItem(value: s, child: Text(s)),
                  ],
                  onChanged: (v) => controller.regState.value = v,
                  validator: Validators.required,
                ),
              ),
              Obx(
                () => CommonUploadField(
                  label: AppStrings.qualificationCertificate,
                  placeholder: AppStrings.upload,
                  fileName: controller.regCertFileName.value,
                  onTap: controller.pickCertificate,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            CommonTextAreaField(
              label: AppStrings.companyAddress,
              controller: controller.regAddress,
              hintText: AppStrings.hintAddress,
              minLines: 3,
              maxLines: 5,
              validator: Validators.required,
            ),
            const SizedBox(height: AppSpacing.lg),
            Obx(
              () => TermsCheckbox(
                value: controller.agreeTerms.value,
                onChanged: (v) => controller.agreeTerms.value = v,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Obx(
              () => CommonButton(
                label: AppStrings.createAccount.toUpperCase(),
                onPressed: controller.submitRegistration,
                isLoading: controller.isLoading.value,
                fullWidth: true,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            CommonButton(
              label: AppStrings.cancel.toUpperCase(),
              style: CommonButtonStyle.outline,
              onPressed: controller.cancelRegistration,
              fullWidth: true,
            ),
            const SizedBox(height: AppSpacing.xl),
            AuthFooter(
              prompt: AppStrings.alreadyHaveAccount,
              actionLabel: AppStrings.signIn,
              onTap: controller.goToLoginFromRegistration,
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }

  /// Two fields side-by-side on tablet/desktop; stacked on phones.
  Widget _twoCol(BuildContext context, Widget left, Widget right) {
    if (!context.isWide) {
      return Column(
        children: [
          left,
          const SizedBox(height: AppSpacing.md),
          right,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        const SizedBox(width: AppSpacing.xl),
        Expanded(child: right),
      ],
    );
  }
}
