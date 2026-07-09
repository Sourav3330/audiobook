import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../utils/snackbar_utils.dart';
import '../../shell/controllers/shell_controller.dart';

/// Backs the Scanner tab with a live camera QR scanner (mobile_scanner).
///
/// The camera is paused when the user leaves the Scanner tab (or backgrounds
/// the app) and resumed when they return — this avoids a blank/frozen preview
/// and frees the camera for other apps.
class ScannerController extends GetxController with WidgetsBindingObserver {
  // Only decode QR codes, and de-duplicate so one code fires onDetect once.
  final MobileScannerController scannerController = MobileScannerController(
    autoStart: false,
    formats: const [BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  final RxBool isFlashOn = false.obs;
  final RxBool isLoading = false.obs;

  /// The most recently decoded QR payload — drives the result card. `null`
  /// while actively scanning.
  final RxnString lastScanned = RxnString();

  bool _processed = false;
  Worker? _tabWorker;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    // Resume the camera when the user switches back to the Scanner tab; release
    // it when they leave.
    final shell = Get.find<ShellController>();
    _tabWorker = ever<int>(shell.currentIndex, (index) {
      if (index == ShellController.tabScanner) {
        _resumeCamera();
      } else {
        _pauseCamera();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    // Scanner is the default landing tab — make sure the camera is running.
    _resumeCamera();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (lastScanned.value == null) _resumeCamera();
    } else if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      _pauseCamera();
    }
  }

  /// (Re)starts the camera and clears the one-shot guard so a new scan can be
  /// processed. Safe to call when already running.
  Future<void> _resumeCamera() async {
    _processed = false;
    isLoading.value = false;
    try {
      await scannerController.start();
    } catch (_) {
      // Already started / starting — nothing to do.
    }
  }

  Future<void> _pauseCamera() async {
    try {
      await scannerController.stop();
    } catch (_) {/* already stopped */}
  }

  void toggleFlash() {
    isFlashOn.toggle();
    scannerController.toggleTorch();
  }

  /// Called by [MobileScanner] for every detection. Captures the first QR
  /// payload, stops the preview, and surfaces the value.
  void onDetect(BarcodeCapture capture) {
    if (_processed || isLoading.value) return;
    final code = capture.barcodes.isNotEmpty
        ? capture.barcodes.first.rawValue
        : null;
    if (code == null || code.trim().isEmpty) return;

    _processed = true;
    lastScanned.value = code.trim();
    _pauseCamera();
    SnackbarUtils.success('QR code scanned.');
  }

  /// Clears the result and turns the live preview back on.
  Future<void> scanAgain() async {
    lastScanned.value = null;
    await _resumeCamera();
  }

  void onNotificationsTap() => SnackbarUtils.info('No new notifications.');

  @override
  void onClose() {
    _tabWorker?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    scannerController.dispose();
    super.onClose();
  }
}
