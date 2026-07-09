import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../auth/services/auth_service.dart';

/// Decides where to go after the splash screen: straight into the app if a
/// session is already active, otherwise to the login screen.
class SplashController extends GetxController {
  final AuthService _authService = AuthService();

  /// How long to keep the branded splash on screen before routing.
  static const _minDisplay = Duration(milliseconds: 1500);

  @override
  void onReady() {
    super.onReady();
    _decideNextRoute();
  }

  Future<void> _decideNextRoute() async {
    // Hold the splash briefly so it doesn't just flash.
    await Future<void>.delayed(_minDisplay);
    // Firebase is already initialised in main(), so currentUser is reliable.
    final next =
        _authService.isLoggedIn ? AppRoutes.shell : AppRoutes.login;
    Get.offAllNamed<void>(next);
  }
}
