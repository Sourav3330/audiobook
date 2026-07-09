import 'package:get/get.dart';

import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/registration_view.dart';
import '../../modules/auth/views/signup_view.dart';
import '../../modules/history/controllers/inspection_detail_controller.dart';
import '../../modules/history/views/inspection_detail_view.dart';
import '../../modules/profile/controllers/change_password_controller.dart';
import '../../modules/profile/controllers/personal_info_controller.dart';
import '../../modules/profile/views/change_password_view.dart';
import '../../modules/profile/views/personal_info_view.dart';
import '../../modules/shell/bindings/shell_binding.dart';
import '../../modules/shell/views/shell_view.dart';
import '../../modules/splash/controllers/splash_controller.dart';
import '../../modules/splash/views/splash_view.dart';
import 'app_routes.dart';

/// The app's route table. Each [GetPage] maps a route name (from [AppRoutes])
/// to the screen widget to show and an optional `binding` that registers the
/// controllers that screen needs, right before it opens.
///
/// Navigate with `Get.toNamed(AppRoutes.signup)` (push) or
/// `Get.offAllNamed(AppRoutes.shell)` (replace the whole stack).
class AppPages {
  AppPages._();

  static String get initial => AppRoutes.splash;

  static final List<GetPage<dynamic>> routes = [
    // ── Splash — decides login vs shell based on the auth session. ──────────
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      // `put` (not lazyPut) so the controller is created immediately and its
      // onReady() runs the auth check + navigation.
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    // ── Auth screens — all share one AuthBinding (one AuthController). ──────
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.registration,
      page: () => const RegistrationView(),
      binding: AuthBinding(),
    ),
    // ── The authenticated app — bottom-nav host + its four tab controllers. ─
    GetPage(
      name: AppRoutes.shell,
      page: () => const ShellView(),
      binding: ShellBinding(),
    ),
    // ── Screens pushed on top of the shell.
    // ─────────────────────────────────
    GetPage(
      name: AppRoutes.inspectionDetail,
      page: () => const InspectionDetailView(),
      // Builds the record (from Get.arguments) + joint data for the screen.
      binding: BindingsBuilder(() {
        Get.lazyPut(InspectionDetailController.new);
      }),
    ),
    GetPage(
      name: AppRoutes.personalInfo,
      page: () => const PersonalInfoView(),
      // Inline binding: create the controller lazily when this route opens.
      binding: BindingsBuilder(() {
        Get.lazyPut(PersonalInfoController.new);
      }),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(ChangePasswordController.new);
      }),
    ),
  ];
}
