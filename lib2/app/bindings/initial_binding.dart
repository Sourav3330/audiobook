import 'package:get/get.dart';

import '../../modules/auth/controllers/auth_controller.dart';

/// Global dependency wiring run once at app startup. [AuthController] is shared
/// by all auth screens, so it's registered once here as `permanent` — popping a
/// route never disposes its [TextEditingController]s out from under a screen.
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController(), permanent: true);
    }
  }
}
