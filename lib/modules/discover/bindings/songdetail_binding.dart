import 'package:audio_book/modules/discover/controller/songDetail_controller.dart';
import 'package:get/get.dart';

class SongDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongDetailController>(
      () => SongDetailController(),
      fenix: true,
    );
  }
}
