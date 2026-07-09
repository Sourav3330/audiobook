import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';

/// Canonical green app bar for the Inspector app.
///
/// Wraps Flutter's [AppBar] with the solid-primary background + white title
/// used across the tab and flow screens. Routing every screen through this
/// widget means app-bar styling lives in exactly one place.
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Page title rendered on the left.
  final String title;

  /// Actions appended on the right (notification bell, overflow menu, …).
  final List<Widget> actions;

  /// When `true` (default), shows the back arrow if there's a previous route.
  /// Set to `false` on root tab screens.
  final bool showBackButton;

  /// Override the leading widget entirely. Wins over [showBackButton].
  final Widget? leading;

  final VoidCallback? onBack;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.showBackButton = true,
    this.leading,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyles.appBarTitle),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      automaticallyImplyLeading: showBackButton && leading == null,
      leading: leading ??
          (showBackButton && onBack != null
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBack,
                )
              : null),
      actions: actions,
    );
  }
}
