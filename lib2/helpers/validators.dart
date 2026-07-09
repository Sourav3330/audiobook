import '../constants/app_strings.dart';

/// Form validators returning the standard `String?` accepted by [TextFormField].
class Validators {
  Validators._();

  static String? required(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? AppStrings.required;
    }
    return null;
  }

  static String? email(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return AppStrings.required;
    final ok = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v);
    return ok ? null : AppStrings.invalidEmail;
  }

  /// Login accepts either an email OR an inspector ID, so only require non-empty.
  static String? credential(String? value) {
    return required(value);
  }

  static String? password(String? value, {int min = 8}) {
    final v = value ?? '';
    if (v.isEmpty) return AppStrings.required;
    if (v.length < min) return AppStrings.passwordTooShort;
    return null;
  }

  /// Confirm-password validator. Pass the value of the *password* field as
  /// [against].
  static String? confirmPassword(String? value, String against) {
    final base = password(value);
    if (base != null) return base;
    if (value != against) return AppStrings.passwordsDoNotMatch;
    return null;
  }

  static String? name(String? value, {int min = 2}) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return AppStrings.required;
    if (v.length < min) return 'Name is too short';
    return null;
  }

  static String? phone(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return AppStrings.required;
    if (v.replaceAll(RegExp(r'[^0-9]'), '').length < 7) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
