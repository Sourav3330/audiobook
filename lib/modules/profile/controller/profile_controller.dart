import 'package:audio_book/modules/auth/services/auth_service.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class ProfileController extends GetxController{
final AuthService auth = AuthService();
Future<void>logout()async
{
 await auth.signOut();
}
void goToAppLock(){
 Get.toNamed(AppRoutes.appLock);
}
void goToPrivacy(){
 Get.toNamed(AppRoutes.privacy);
}
void goToPlans(){
 Get.toNamed(AppRoutes.plans);
}
void goToHelp(){
 Get.toNamed(AppRoutes.help);
}
void goToPushNotification(){
 Get.toNamed(AppRoutes.pushNotification);
}


}