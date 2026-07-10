import 'package:audio_book/common%20widget/forms/common_text_field.dart';
import 'package:audio_book/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common widget/auth_scaffold.dart';
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

      cardChild: Column(
        children: [
          CommonTextField(
            prefixIcon: Icons.person_outline,
            label: AppStrings.labelUsername,
            hintText: AppStrings.hintUsername,
            controller: controller.username,
            textInputAction: TextInputAction.next,
          ),
          CommonEmailField(
            prefixIcon: Icons.email_outlined,
            controller: controller.loginEmail,
            textInputAction: TextInputAction.next,
            validator: (_) {
              return null;
            },
            focusNode: controller.loginEmailNode,
          ),
          CommonPassField(
            prefixIcon: Icons.lock_open,
            controller: controller.signupPass,
            textInputAction: TextInputAction.next,
            validator: (_) {
              return null;
            },
            focusNode: controller.loginPassNode,
          ),
          CommonTextField(

            prefixIcon: Icons.privacy_tip_outlined,
            hintText:AppStrings.paasHint ,
            controller: controller.confirmSignupPass,
            textInputAction: TextInputAction.done,
            validator: (_) {
              return null;
            },
            focusNode: controller.confirmSignupPassNode,
            label: AppStrings.reenterPassLabel,

          ),
        ],
      ),
      bottomLoginOrSignupButtonText: AppStrings.signupBottomButtonText,
      bottomLoginOrSignupMessage: AppStrings.signupBottomMessage,
      onTapGoogle: () {},
      onTapIos: () {},
      toggleLoginSignup: () {
        controller.signupToLogin();
      },
      buttonText: AppStrings.signupButtonText,
      buttonOnTap: () {},
      onTapLoginSignup: (){
        controller.signupToLogin();
      },

    );
  }
}
