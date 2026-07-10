import 'package:flutter/material.dart';

class Validator {
  Validator._();

  static String? confirmPassword(TextEditingController password,TextEditingController confirmPassword) {
    if(password.text.isNotEmpty && password.text.trim()!=confirmPassword.text.trim() ){
    return 'password not match';
    }else {
    return null;
    }
  }
}