import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

/// One shared [AuthController] across all three auth screens. Registered as
/// `permanent` and only once, so popping a route never disposes the controller
/// (and its [TextEditingController]s) out from under a still-mounted screen.
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController(), permanent: true);
    }
  }
}
