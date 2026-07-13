import 'package:audio_book/common%20widget/auth_scaffold.dart';
import 'package:audio_book/common%20widget/common_bottom_button.dart';
import 'package:audio_book/common%20widget/forms/common_email_field.dart';
import 'package:audio_book/common%20widget/forms/common_pass_field.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/helpers/validator.dart';
import 'package:audio_book/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      topScreenMessage: AppStrings.loginTopMessage,
      topScreenTitle: AppStrings.loginTopTitle,

      cardChild: Form(
        key: controller.loginKey,
        child: AutofillGroup(
          child: Column(
            children: [
              CommonEmailField(
                autofillHints: const[AutofillHints.email],
                controller: controller.loginEmail,
                textInputAction: TextInputAction.next,
                validator: Validator.emailValidator,
                focusNode: controller.loginEmailNode,
                prefixIcon: Icons.alternate_email,
              ),
              CommonPassField(
                autofillHints: const[AutofillHints.password],
                controller: controller.loginPass,
                textInputAction: TextInputAction.done,
                prefixIcon: Icons.lock_open,
                validator: (value) {
                  return Validator.password(value);
                },
                focusNode: controller.loginPassNode,
              ),
            ],
          ),
        ),
      ),
      bottomButtonWidget: Obx(()=>
         CommonBottomButton(text: AppStrings.loginButtonText, onTap: (){
          controller.login();
        }, isLoading: controller.isLoading.value),
      ),
      isLoading: controller.isLoading.value,
      bottomLoginOrSignupButtonText: AppStrings.loginBottomButtonText,
      bottomLoginOrSignupMessage: AppStrings.loginBottomMessage,
      onTapGoogle: () {},
      onTapIos: () {},
      toggleLoginSignup: () {
        controller.loginToSignup();
      },
      buttonOnTap:(){
        controller.login();
      } ,
      buttonText: AppStrings.loginButtonText,
      onTapLoginSignup: (){
        controller.loginToSignup();
      },
    );
  }
}
