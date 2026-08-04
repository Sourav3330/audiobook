import 'package:audio_book/modules/profile/controller/privacy_controller.dart';
import 'package:get/get.dart';

class PrivacyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PrivacyController(),fenix: true);
  }
}