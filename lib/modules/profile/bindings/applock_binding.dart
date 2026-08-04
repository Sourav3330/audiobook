import 'package:audio_book/modules/profile/controller/applock_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class ApplockBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApplockController>(()=>ApplockController(),fenix: true);
  }
}