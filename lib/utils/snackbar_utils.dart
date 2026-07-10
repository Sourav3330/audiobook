import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

/// Snackbar helpers. Controllers call `SnackbarUtils.success / error / info`
/// instead of constructing raw `Get.snackbar` calls so styling stays uniform.
class SnackbarUtils {
  SnackbarUtils._();

  static void success(String message, {String title = 'Success'}) {
    _show(title, message, AppColors.success, Icons.check_circle_outline);
  }

  static void error(String message, {String title = 'Error'}) {
    _show(title, message, AppColors.error, Icons.error_outline);
  }

  static void info(String message, {String title = 'Info'}) {
    _show(title, message, AppColors.info, Icons.info_outline);
  }

  static void warning(String message, {String title = 'Heads up'}) {
    _show(title, message, AppColors.warning, Icons.warning_amber_outlined);
  }

  static void _show(String title, String message, Color color, IconData icon) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: color),
      colorText: AppColors.primary,
      backgroundColor: Colors.white,
      borderColor: color.withValues(alpha: 0.5),
      borderWidth: 1,
      margin: const EdgeInsets.all(16),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }
}
