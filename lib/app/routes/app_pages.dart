import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/modules/splash/controllers/splash_controller.dart';
import 'package:audio_book/modules/splash/views/splash_view.dart';
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
  ];
}
