import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/snackbar_utils.dart';
import '../../auth/services/auth_service.dart';

/// Backs the Profile tab — loads the signed-in inspector's identity from
/// Firestore and handles sign-out.
class ProfileController extends GetxController {
  final AuthService _authService = AuthService();

  final RxString name = AppStrings.userName.obs;
  final RxString role = 'Inspector'.obs;
  final RxString email = ''.obs;
  final RxString inspectorId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final user = _authService.currentUser;
    if (user == null) return;
    email.value = user.email ?? '';
    inspectorId.value =
        user.uid.length >= 6 ? user.uid.substring(0, 6).toUpperCase() : user.uid;
    try {
      final doc = await _authService.fetchInspector(user.uid);
      if (doc != null) {
        if (doc.fullName.isNotEmpty) name.value = doc.fullName;
        role.value = _titleCase(doc.role);
        if (doc.email.isNotEmpty) email.value = doc.email;
      }
    } catch (_) {
      // Keep the defaults if the profile can't be read.
    }
  }

  String _titleCase(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  void openPersonalInfo() => Get.toNamed<void>(AppRoutes.personalInfo);
  void changePassword() => Get.toNamed<void>(AppRoutes.changePassword);
  void helpSupport() => SnackbarUtils.info(AppStrings.comingSoon);
  void onNotificationsTap() => SnackbarUtils.info('No new notifications.');

  Future<void> logout() async {
    await _authService.signOut();
    Get.offAllNamed<void>(AppRoutes.login);
  }
}
