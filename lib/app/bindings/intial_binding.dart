import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:audio_book/modules/auth/controller/auth_controller.dart';
import 'package:audio_book/services/audio_service.dart';
import 'package:get/get.dart';

class IntialBinding extends Bindings {

  @override
  void dependencies() {
    if(Get.isRegistered<AuthController>()){
      Get.put(AuthController());
    }
    Get.lazyPut<BookRepository>(()=>BookRepository());
    Get.put(AudioService(),permanent: true);
  }

}