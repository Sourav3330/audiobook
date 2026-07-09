import 'package:get/get.dart';

/// Drives the bottom-nav. The four tabs are kept alive via an [IndexedStack] in
/// `ShellView`, so each keeps its own scroll position / controller state.
class ShellController extends GetxController {
  // Fixed index for each tab — used instead of magic numbers so code reads
  // clearly (e.g. `ScannerController` checks `index == tabScanner`).
  static const int tabScanner = 0;
  static const int tabDashboard = 1;
  static const int tabHistory = 2;
  static const int tabProfile = 3;

  // The currently-selected tab. `.obs` makes it observable — any `Obx` that
  // reads `currentIndex.value` rebuilds automatically when it changes.
  final RxInt currentIndex = tabScanner.obs;

  /// Switch to [index]. Called by the bottom-nav buttons.
  void setIndex(int index) => currentIndex.value = index;

  // Named shortcuts for readability at call sites.
  void goToScanner() => setIndex(tabScanner);
  void goToDashboard() => setIndex(tabDashboard);
  void goToHistory() => setIndex(tabHistory);
  void goToProfile() => setIndex(tabProfile);
}
