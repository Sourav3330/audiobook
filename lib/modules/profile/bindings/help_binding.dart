import 'package:audio_book/modules/profile/controller/helpsupport_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HelpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HelpSupportController>(()=>HelpSupportController(),fenix: true);
  }
}