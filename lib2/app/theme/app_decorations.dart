import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import 'app_text_styles.dart';

/// Reusable `BoxDecoration` / `InputDecoration` presets. Keeping these here
/// keeps card borders and field shapes consistent across modules.
class AppDecorations {
  AppDecorations._();

  /// White card with a hairline border + soft shadow — the "main" surface.
  static BoxDecoration card({double radius = AppSizes.radius12}) =>
      BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.divider),
      );

  /// Flat outlined card — no shadow.
  static BoxDecoration outlineCard({double radius = AppSizes.radius12}) =>
      BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.divider),
      );

  /// Subtle nested panel.
  static BoxDecoration subtleCard({double radius = AppSizes.radius12}) =>
      BoxDecoration(
        color: AppColors.subtleBg,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.divider),
      );
}

/// `InputDecoration` factory shared by every Common*Field input role so heights
/// and borders stay locked.
class AppInputDecoration {
  AppInputDecoration._();

  static const EdgeInsets _standardPadding = EdgeInsets.symmetric(
    horizontal: AppSizes.padding16,
    vertical: AppSizes.inputContentPaddingVertical,
  );

  static InputDecoration textField({
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? helperText,
    String? errorText,
    String? counterText,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return _base().copyWith(
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      helperText: helperText,
      errorText: errorText,
      counterText: counterText,
      contentPadding: contentPadding ?? _standardPadding,
    );
  }

  static InputDecoration search({String? hint}) {
    return _base().copyWith(
      hintText: hint,
      prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.textMuted),
      contentPadding: _standardPadding,
    );
  }

  static InputDecoration _base() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.inputFill,
      isDense: false,
      hintStyle: AppTextStyles.placeholder,
      prefixIconConstraints: const BoxConstraints(
        minWidth: 44,
        minHeight: AppSizes.inputHeight,
      ),
      suffixIconConstraints: const BoxConstraints(
        minWidth: 44,
        minHeight: AppSizes.inputHeight,
      ),
      enabledBorder: _border(AppColors.border),
      focusedBorder: _border(AppColors.primary, width: 1.5),
      disabledBorder: _border(AppColors.border.withValues(alpha: 0.6)),
      errorBorder: _border(AppColors.error),
      focusedErrorBorder: _border(AppColors.error, width: 1.5),
    );
  }

  static OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radius8),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
