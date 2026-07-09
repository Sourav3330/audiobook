import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../common_widgets/common_button.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CommonAppBar(
        title: AppStrings.welcomeInspector,
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: controller.onNotificationsTap,
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      // Full-bleed camera fills the whole tab body; the UI floats on top.
      body: Stack(
        fit: StackFit.expand,
        // alignment: AlignmentGeometry.center,
        children: [
          // 1) Live camera preview — fills the screen.
          MobileScanner(
            controller: controller.scannerController,
            onDetect: controller.onDetect,
            fit: BoxFit.cover,
            errorBuilder: (context, error) => const _CameraError(),
          ),

          // 2) Green low-opacity mask everywhere except the centre window,
          //    with the corner brackets around it.
          const Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: _ScannerOverlayPainter()),
            ),
          ),

          // 3) Floating UI — header at the top, info + flash at the bottom.
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.padding24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(flex: 1,),
                  _header(),
                  // const Spacer(flex: 8,),
                  const Spacer(),
                  _bottomPanel(),
                  // const Spacer(flex: 1,),
                ],
              ),
            ),
          ),
          // Positioned(top: 0,child: _header()),
          // Positioned(bottom: 0,child: _bottomPanel()),

          // 4) Loading spinner while a detection is being processed.
          Positioned.fill(
            child: Obx(
              () => controller.isLoading.value
                  ? const ColoredBox(
                      color: Colors.black45,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),

          // 5) Result scrim + card once a code is decoded.
          Positioned.fill(
            child: Obx(() {
              final scanned = controller.lastScanned.value;
              if (scanned == null) return const SizedBox.shrink();
              return _ResultOverlay(
                value: scanned,
                onScanAgain: controller.scanAgain,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding16,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(AppSizes.radius24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.qr_code_2, size: 26, color: AppColors.primary),
          const SizedBox(width: AppSpacing.sm),
          Text(
            AppStrings.scanQrCode,
            style: AppTextStyles.h3.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _bottomPanel() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _infoCard(),
          const SizedBox(height: AppSpacing.md),
          // _flashButton(),
        ],
      ),
    );
  }

  Widget _infoCard() {
    return AppCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding40,
        vertical: AppSizes.padding48,
      ),
      child: Text(
        AppStrings.scanInstruction,
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
      ),
    );
  }

  Widget _flashButton() {
    return Obx(
      () => CommonButton(
        label: controller.isFlashOn.value
            ? AppStrings.turnOffFlash
            : AppStrings.turnOnFlash,
        icon: controller.isFlashOn.value ? Icons.flash_off : Icons.flash_on,
        onPressed: controller.toggleFlash,
        fullWidth: true,
      ),
    );
  }
}

/// Centre window geometry shared by the overlay painter and result layout.
Rect _scanWindow(Size size) {
  // Largest square that fits comfortably. Computed with min/max (not `clamp`)
  // so it never throws when the box is briefly tiny/zero during the first
  // layout pass — `clamp(lower, upper)` asserts when `lower > upper`.
  final candidates = <double>[size.width * 0.72, size.height * 0.6, 460.0];
  final fit = candidates.reduce((a, b) => a < b ? a : b);
  final side = fit < 220.0 ? 220.0 : fit;
  return Rect.fromCenter(
    center: Offset(size.width / 2, size.height * 0.44),
    width: side,
    height: side,
  );
}

/// Paints a low-opacity green mask over everything except the centre scan
/// window, then draws the four green corner brackets.
class _ScannerOverlayPainter extends CustomPainter {
  const _ScannerOverlayPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final window = _scanWindow(size);
    final rrect =
        RRect.fromRectAndRadius(window, const Radius.circular(AppSizes.radius8));

    // Green wash over the whole screen minus the clear window.
    final mask = Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & size),
      Path()..addRRect(rrect),
    );
    canvas.drawPath(
      mask,
      Paint()..color = AppColors.primary.withValues(alpha: 0.4),
    );

    // Corner brackets.
    final bracket = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;
    final len = window.width * 0.20;

    void corner(Offset c, double dx, double dy) {
      canvas.drawLine(c, c.translate(dx, 0), bracket);
      canvas.drawLine(c, c.translate(0, dy), bracket);
    }

    corner(window.topLeft, len, len);
    corner(window.topRight, -len, len);
    corner(window.bottomLeft, len, -len);
    corner(window.bottomRight, -len, -len);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ResultOverlay extends StatelessWidget {
  final String value;
  final VoidCallback onScanAgain;

  const _ResultOverlay({required this.value, required this.onScanAgain});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.6),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: AppCard(
              padding: const EdgeInsets.all(AppSizes.padding24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle,
                      color: AppColors.success, size: 44),
                  const SizedBox(height: AppSpacing.sm),
                  Text(AppStrings.qrCodeScanned, style: AppTextStyles.h4),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.inputFill,
                      borderRadius: BorderRadius.circular(AppSizes.radius8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: SelectableText(
                      value,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMd
                          .copyWith(color: AppColors.textPrimary),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  CommonButton(
                    label: AppStrings.scanAgain,
                    icon: Icons.qr_code_scanner,
                    onPressed: onScanAgain,
                    fullWidth: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CameraError extends StatelessWidget {
  const _CameraError();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.padding24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.no_photography_outlined,
                size: 48, color: Colors.white),
            const SizedBox(height: AppSpacing.md),
            Text(
              AppStrings.cameraUnavailable,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMd.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
