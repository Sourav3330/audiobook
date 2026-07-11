import 'package:audio_book/constants/app_strings.dart';
import 'package:flutter/material.dart';

class Validator {
  Validator._();

  static String? required(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredMessage;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    final error = required(value);
    if (error == null) {
      final v = value!.trim();
      final ok = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v);
      return ok ? null : AppStrings.invalidEmail;
    }
    return error;
  }

  static String? password(String? pass) {
    return required(pass);
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    final error = required(
      confirmPassword,
      message: AppStrings.passwordNotSame,
    );
    if (error != null) return error;

    if (password?.trim() != confirmPassword!.trim()) {
      return AppStrings.passwordNotSame;
    }
    return null;
  }

}
