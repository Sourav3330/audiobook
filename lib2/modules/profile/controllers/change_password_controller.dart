import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/snackbar_utils.dart';
import '../../auth/services/auth_service.dart';

/// Backs the Change Password screen.
class ChangePasswordController extends GetxController {
  final AuthService _authService = AuthService();

  final formKey = GlobalKey<FormState>();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> submit() async {
    // Validate all three fields first.
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    try {
      // Re-authenticate with the current password, then set the new one.
      await _authService.changePassword(
        currentPassword: currentPassword.text,
        newPassword: newPassword.text,
      );
      // Force a fresh sign-in with the new password (security best practice).
      await _authService.signOut();
      SnackbarUtils.success(AppStrings.passwordUpdatedSignIn);
      Get.offAllNamed<void>(AppRoutes.login);
    } on AuthException catch (e) {
      SnackbarUtils.error(e.message);
    } catch (_) {
      SnackbarUtils.error(AppStrings.somethingWentWrong);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
