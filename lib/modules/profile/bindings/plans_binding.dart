import 'package:audio_book/modules/profile/controller/plans_controller.dart';
import 'package:get/get.dart';

class PlansBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PlansController(),fenix: true);
  }
}