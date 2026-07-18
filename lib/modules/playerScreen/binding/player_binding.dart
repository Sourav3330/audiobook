import 'package:audio_book/modules/playerScreen/controllers/player_controller.dart';
import 'package:get/get.dart';

class PlayerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PlayerController>(()=>PlayerController());
  }
}