import 'package:get/get.dart';

import '../../dashboard/controllers/dashboard_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../scanner/controllers/scanner_controller.dart';
import '../controllers/shell_controller.dart';

class ShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShellController());
    // Tab controllers — created lazily so opening the Scanner tab doesn't have
    // to wait for the others. `fenix` re-creates them if ever disposed.
    Get.lazyPut(ScannerController.new, fenix: true);
    Get.lazyPut(DashboardController.new, fenix: true);
    Get.lazyPut(HistoryController.new, fenix: true);
    Get.lazyPut(ProfileController.new, fenix: true);
  }
}
