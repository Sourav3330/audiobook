import 'package:audio_book/app/bindings/intial_binding.dart';
import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/modules/auth/binding/auth_binding.dart';
import 'package:audio_book/modules/auth/views/login_view.dart';
import 'package:audio_book/modules/auth/views/signup_view.dart';
import 'package:audio_book/modules/discover/bindings/songdetail_binding.dart';
import 'package:audio_book/modules/discover/view/song_detail.dart';
import 'package:audio_book/modules/library/bindings/cate_data_binding.dart';
import 'package:audio_book/modules/library/view/cate_data_view.dart';
import 'package:audio_book/modules/playerScreen/binding/player_binding.dart';
import 'package:audio_book/modules/playerScreen/view/player_view.dart';
import 'package:audio_book/modules/profile/bindings/applock_binding.dart';
import 'package:audio_book/modules/profile/bindings/help_binding.dart';
import 'package:audio_book/modules/profile/bindings/plans_binding.dart';
import 'package:audio_book/modules/profile/bindings/privacy_binding.dart';
import 'package:audio_book/modules/profile/bindings/push_notification_binding.dart';
import 'package:audio_book/modules/profile/view/applock_view.dart';
import 'package:audio_book/modules/profile/view/helpsupport_view.dart';
import 'package:audio_book/modules/profile/view/plans_view.dart';
import 'package:audio_book/modules/profile/view/privacy_view.dart';
import 'package:audio_book/modules/profile/view/push_notification_view.dart';
import 'package:audio_book/modules/profile/view/theme_selection_view.dart';
import 'package:audio_book/modules/shell/binding/shell_binding.dart';
import 'package:audio_book/modules/shell/view/shell_view.dart';
import 'package:audio_book/modules/splash/controllers/splash_controller.dart';
import 'package:audio_book/modules/splash/views/splash_view.dart';
import 'package:audio_book/modules/test/test_binding.dart';
import 'package:audio_book/modules/test/test_view.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.shell,
      page: () => ShellView(),
      binding: ShellBinding(),
    ),
    GetPage(
        name: AppRoutes.songDetail,
        page: () => SongDetail(),
      binding: SongDetailBinding()
    ),
    GetPage(
        name: AppRoutes.cateDetail,
        page: () => CateDataView(),
      binding: CateDataBinding()
    ),
    GetPage(
        name: AppRoutes.player,
        page: () => PlayerView(),
      binding: PlayerBinding()
    ),
    GetPage(
        name: AppRoutes.test,
        page: () => TestView(),
      binding: TestBinding()
    ),
    GetPage(
        name: AppRoutes.appLock,
        page: () => ApplockView(),
      binding: ApplockBinding()
    ),
    GetPage(
        name: AppRoutes.privacy,
        page: () => PrivacyView(),
      binding: PrivacyBinding()
    ),
    GetPage(
        name: AppRoutes.plans,
        page: () => PlansView(),
      binding: PlansBinding()
    ),
    GetPage(
        name: AppRoutes.help,
        page: () => HelpSupportView(),
      binding: HelpBinding()
    ),
     GetPage(
        name: AppRoutes.pushNotification,
        page: () => PushNotificationView(),
      binding: PushNotificationBinding()
    ),
    GetPage(
        name: AppRoutes.themeSelection,
        page: () => ThemeSelectionView(),
    ),

  ];
}
