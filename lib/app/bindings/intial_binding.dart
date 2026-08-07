import 'package:audio_book/app/theme/theme_controller.dart';
import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:audio_book/data/service/hiveServices/hive_service.dart';
import 'package:audio_book/modules/auth/controller/auth_controller.dart';
import 'package:audio_book/services/audio_service.dart';
import 'package:get/get.dart';

class IntialBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController());
    }
    Get.put(HiveService(),permanent: true);
    Get.lazyPut<BookRepository>(() => BookRepository(),fenix: true);
    Get.lazyPut<AudioService>(() => AudioService(), fenix: true);
    Get.put(ThemeController(),permanent: true);
  }
}
