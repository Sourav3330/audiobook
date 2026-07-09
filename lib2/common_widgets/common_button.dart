import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

enum CommonButtonStyle { primary, outline, ghost, danger }

/// Standard button used across the Inspector app. Supports loading state,
/// leading icon, and trailing icon.
class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final CommonButtonStyle style;
  final IconData? icon;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool fullWidth;
  final double? height;

  const CommonButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = CommonButtonStyle.primary,
    this.icon,
    this.trailingIcon,
    this.isLoading = false,
    this.fullWidth = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final spinnerColor = style == CommonButtonStyle.primary ||
            style == CommonButtonStyle.danger
        ? Colors.white
        : AppColors.primary;

    final child = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(spinnerColor),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: AppSpacing.sm),
              ],
              Text(label),
              if (trailingIcon != null) ...[
                const SizedBox(width: AppSpacing.sm),
                Icon(trailingIcon, size: 18),
              ],
            ],
          );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.radius8),
    );
    final size = Size(
      fullWidth ? double.infinity : 0,
      height ?? AppSizes.buttonHeight,
    );

    switch (style) {
      case CommonButtonStyle.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(minimumSize: size, shape: shape),
          child: child,
        );
      case CommonButtonStyle.outline:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(minimumSize: size, shape: shape),
          child: child,
        );
      case CommonButtonStyle.ghost:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(minimumSize: size, shape: shape),
          child: child,
        );
      case CommonButtonStyle.danger:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: size,
            shape: shape,
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
          ),
          child: child,
        );
    }
  }
}
