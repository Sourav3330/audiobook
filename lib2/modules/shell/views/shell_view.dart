import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../history/views/history_view.dart';
import '../../profile/views/profile_view.dart';
import '../../scanner/views/scanner_view.dart';
import '../controllers/shell_controller.dart';

/// Bottom-nav scaffold. The four tabs live inside an [IndexedStack] so each
/// keeps its own scroll position and controller state across navigations.
class ShellView extends GetView<ShellController> {
  const ShellView({super.key});

  static const _tabs = <_TabItem>[
    _TabItem(Icons.qr_code_scanner, AppStrings.tabScanner),
    _TabItem(Icons.dashboard_outlined, AppStrings.tabDashboard),
    _TabItem(Icons.history, AppStrings.tabHistory),
    _TabItem(Icons.person_outline, AppStrings.tabProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Obx rebuilds only when `currentIndex` changes. IndexedStack keeps ALL
      // four tab widgets alive and simply shows the selected one — so each tab
      // preserves its scroll position / camera / form state when you switch.
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            ScannerView(), // index 0
            DashboardView(), // index 1
            HistoryView(), // index 2
            ProfileView(), // index 3
          ],
        ),
      ),
      // The custom green-pill bottom navigation bar (below).
      bottomNavigationBar: _BottomNav(controller: controller),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final ShellController controller;

  const _BottomNav({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.navBarBorder)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.sm,
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < ShellView._tabs.length; i++)
                  _NavButton(
                    item: ShellView._tabs[i],
                    selected: controller.currentIndex.value == i,
                    onTap: () => controller.setIndex(i),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final _TabItem item;
  final bool selected;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Selected tab: white icon/label on a green pill. Unselected: grey, no pill.
    final color = selected ? Colors.white : AppColors.textSecondary;
    return GestureDetector(
      // `opaque` makes the whole padded area tappable, not just the icon/text.
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      // AnimatedContainer smoothly fades the green pill in/out on selection.
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding20,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radius12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, size: 24, color: color),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem {
  final IconData icon;
  final String label;
  const _TabItem(this.icon, this.label);
}
