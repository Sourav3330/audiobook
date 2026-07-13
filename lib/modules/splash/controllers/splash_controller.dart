import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/modules/auth/services/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  final AuthService auth = AuthService();
@override
void onReady() {
    super.onReady();
    nextScreen();
  }
Future<void> nextScreen() async {
  await Future<void>.delayed(Duration(milliseconds: 1000));
 final next =  auth.isLoggedIn ? AppRoutes.shell:AppRoutes.login;
 Get.offAllNamed(next);
}
}