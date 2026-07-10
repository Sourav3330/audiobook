import 'package:audio_book/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  //login text field;
  final loginEmail = TextEditingController();
  final loginPass = TextEditingController();
  final loginEmailNode = FocusNode();
  final loginPassNode = FocusNode();

  //signup text field;
  final signupEmail = TextEditingController();
  final signupPass = TextEditingController();
  final confirmSignupPass = TextEditingController();
  final username = TextEditingController();
  final signupEmailNode = FocusNode();
  final signupPassNode = FocusNode();
  final confirmSignupPassNode = FocusNode();

  void loginToSignup()=>Get.offNamed(AppRoutes.signup);
  void signupToLogin()=>Get.offNamed(AppRoutes.login);
}