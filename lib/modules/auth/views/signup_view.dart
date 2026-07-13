import 'package:audio_book/common%20widget/forms/common_text_field.dart';
import 'package:audio_book/helpers/validator.dart';
import 'package:audio_book/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common widget/auth_scaffold.dart';
import '../../../common widget/common_bottom_button.dart';
import '../../../common widget/forms/common_email_field.dart';
import '../../../common widget/forms/common_pass_field.dart';
import '../../../constants/app_strings.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      topScreenMessage: AppStrings.signupTopMessage,
      topScreenTitle: AppStrings.signupTopTitle,

      cardChild: Form(
        key: controller.signupKey,
        child: AutofillGroup(
          child: Column(
            children: [
              CommonTextField(
                autofillHints: const[AutofillHints.username],
                prefixIcon: Icons.person_outline,
                label: AppStrings.labelUsername,
                hintText: AppStrings.hintUsername,
                controller: controller.username,
                textInputAction: TextInputAction.next,
                validator: (value){
                  return Validator.required(value);
                },
              ),
              CommonEmailField(
                autofillHints: const[AutofillHints.email],
                prefixIcon: Icons.email_outlined,
                controller: controller.signupEmail,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return Validator.emailValidator(value);
                },
                focusNode: controller.loginEmailNode,
              ),
              CommonPassField(
                autofillHints: const[AutofillHints.password],
                prefixIcon: Icons.lock_open,
                controller: controller.signupPass,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return Validator.password(value);
                },
                focusNode: controller.loginPassNode,
              ),
              CommonTextField(
                autofillHints: const[AutofillHints.password],
                prefixIcon: Icons.privacy_tip_outlined,
                hintText:AppStrings.paasHint ,
                controller: controller.confirmSignupPass,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  return
                  Validator.confirmPassword(controller.signupPass.text, value);
                },
                focusNode: controller.confirmSignupPassNode,
                label: AppStrings.reenterPassLabel,

              ),
            ],
          ),
        ),
      ),
      bottomButtonWidget: Obx(()=>
         CommonBottomButton(text: AppStrings.signupButtonText, onTap: (){
          controller.signup();
        }, isLoading: controller.isLoading.value),
      ),
      isLoading: controller.isLoading.value,
      bottomLoginOrSignupButtonText: AppStrings.signupBottomButtonText,
      bottomLoginOrSignupMessage: AppStrings.signupBottomMessage,
      onTapGoogle: () {},
      onTapIos: () {},
      toggleLoginSignup: () {
        controller.signupToLogin();
      },
      buttonText: AppStrings.signupButtonText,
      buttonOnTap: () {
        controller.signup();
      },
      onTapLoginSignup: (){
        controller.signupToLogin();
      },
    );
  }
}
