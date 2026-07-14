import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Widget? leading;
  final List<Widget> actions;
  final VoidCallback? onBack;
  const CommonAppbar({
    super.key,
    this.title = AppStrings.appName,
    this.leading,
    this.onBack,
    this.actions = const [],
    required this.showBackButton,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.scaffoldBg,
      automaticallyImplyLeading: showBackButton && leading == null,
      leading:
         Icon(Icons.menu,size: 30,),
      actions: actions,
    );
  }


}
