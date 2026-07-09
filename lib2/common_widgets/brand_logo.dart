import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// The green rounded-square brand mark with a white clipboard icon, shown atop
/// every auth screen. Defaults to the plain clipboard; pass [icon] to swap in
/// the checked variant used on the signup / registration screens.
class BrandLogo extends StatelessWidget {
  final double size;
  final IconData icon;

  const BrandLogo({
    super.key,
    this.size = AppSizes.brandIcon,
    this.icon = Icons.assignment_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radius8),
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.46),
    );
  }
}
