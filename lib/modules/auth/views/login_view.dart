import 'package:audio_book/common%20widget/auth_scaffold.dart';
import 'package:audio_book/common%20widget/forms/common_email_field.dart';
import 'package:audio_book/common%20widget/forms/common_pass_field.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/modules/auth/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      topScreenMessage: AppStrings.loginTopMessage,
      topScreenTitle: AppStrings.loginTopTitle,

      cardChild: Column(
        children: [
          CommonEmailField(
            controller: controller.loginEmail,
            textInputAction: TextInputAction.next,
            validator: (_) {
              return null;
            },
            focusNode: controller.loginEmailNode,
            prefixIcon: Icons.alternate_email,
          ),
          CommonPassField(
            controller: controller.loginPass,
            textInputAction: TextInputAction.done,
            prefixIcon: Icons.lock_open,
            validator: (_) {
              return null;
            },
            focusNode: controller.loginPassNode,
          ),
        ],
      ),
      bottomLoginOrSignupButtonText: AppStrings.loginBottomButtonText,
      bottomLoginOrSignupMessage: AppStrings.loginBottomMessage,
      onTapGoogle: () {},
      onTapIos: () {},
      toggleLoginSignup: () {
        controller.loginToSignup();
      },
      buttonOnTap:(){} ,
      buttonText: AppStrings.loginButtonText,
      onTapLoginSignup: (){
        controller.loginToSignup();
      },
    );
  }
}
