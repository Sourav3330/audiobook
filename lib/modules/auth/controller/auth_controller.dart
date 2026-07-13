import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/modules/auth/services/auth_service.dart';
import 'package:audio_book/utils/snackbar_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //authService
  final AuthService auth = AuthService();

  //login text field;
  final loginKey = GlobalKey<FormState>();
  final loginEmail = TextEditingController();
  final loginPass = TextEditingController();
  final loginEmailNode = FocusNode();
  final loginPassNode = FocusNode();

  //signup text field;
  final signupKey = GlobalKey<FormState>();
  final signupEmail = TextEditingController();
  final signupPass = TextEditingController();
  final confirmSignupPass = TextEditingController();
  final username = TextEditingController();
  final signupEmailNode = FocusNode();
  final signupPassNode = FocusNode();
  final confirmSignupPassNode = FocusNode();

  void loginToSignup() => Get.offNamed(AppRoutes.signup);
  void signupToLogin() => Get.offNamed(AppRoutes.login);

  final isLoading = false.obs;

  Future<void> signup() async {
    if (!signupKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    try {
      await auth.userSignup(
        name: username.text.trim(),
        email: signupEmail.text.trim(),
        password: signupPass.text.trim(),
      );
      SnackbarUtils.success(AppStrings.accountCreated);
    } on AuthException catch (e) {
      SnackbarUtils.error(e.message);
    } catch (e) {
      SnackbarUtils.error(AppStrings.somethingWentWrong);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    if (!loginKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    try {
      await auth.signIn(
        email: loginEmail.text.trim(),
        password: loginPass.text.trim(),
      );
      Get.offAllNamed(AppRoutes.shell);

    } on AuthException catch (e) {
      SnackbarUtils.error(e.message);
    } catch (e) {
      SnackbarUtils.error(AppStrings.somethingWentWrong);
    } finally {
      isLoading.value = false;
    }
  }
}
