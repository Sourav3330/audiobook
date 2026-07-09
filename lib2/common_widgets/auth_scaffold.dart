import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// Shared chrome for the auth screens — a scrollable, vertically-centred white
/// card on the light scaffold, capped at [maxWidth] so it stays a tidy panel on
/// wide tablets while filling the width on phones.
class AuthScaffold extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry cardPadding;

  const AuthScaffold({
    super.key,
    required this.child,
    this.maxWidth = AppSizes.authMaxWidth,
    this.cardPadding = const EdgeInsets.symmetric(
      horizontal: AppSizes.padding32,
      vertical: AppSizes.padding40,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.padding20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Container(
                width: double.infinity,
                padding: cardPadding,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSizes.radius8),
                  border: Border.all(color: AppColors.divider),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
