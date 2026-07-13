import 'package:audio_book/modules/activity/controller/activity_controller.dart';
import 'package:audio_book/modules/discover/controller/discover_controller.dart';
import 'package:audio_book/modules/library/controller/library_controller.dart';
import 'package:audio_book/modules/profile/controller/profile_controller.dart';
import 'package:audio_book/modules/shell/controller/shell_controller.dart';
import 'package:get/get.dart';

class ShellBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ShellController());
    Get.lazyPut<ProfileController>(()=>ProfileController(),fenix: true);
    Get.lazyPut<ActivityController>(()=>ActivityController(),fenix: true);
    Get.lazyPut<LibraryController>(()=>LibraryController(),fenix: true);
    Get.lazyPut<DiscoverController>(()=>DiscoverController(),fenix: true);
  }
}
