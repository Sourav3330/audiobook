import 'package:audio_book/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class IntialBinding extends Bindings {

  @override
  void dependencies() {
    if(Get.isRegistered<AuthController>()){
      Get.put(AuthController());
    }
  }

}