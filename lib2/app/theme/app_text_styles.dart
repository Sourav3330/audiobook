import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

/// Centralised text styles for the Inspector app.
///
/// Sizes are in logical pixels — they do not scale with viewport width, which
/// keeps headings stable across tablet widths. Use [Responsive] wrappers for
/// layout adaptation instead of shrinking type.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base(double size, FontWeight weight, {Color? color}) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      color: color ?? AppColors.textPrimary,
      height: 1.35,
    );
  }

  // Page-level
  static TextStyle get pageTitle => _base(26, FontWeight.w700);
  static TextStyle get pageSubtitle =>
      _base(15, FontWeight.w400, color: AppColors.textSecondary);

  // Brand / auth headings (rendered in primary green on the auth screens).
  static TextStyle get brandTitle =>
      _base(28, FontWeight.w700, color: AppColors.primary);

  // Headings
  static TextStyle get h1 => _base(26, FontWeight.w700);
  static TextStyle get h2 => _base(22, FontWeight.w700);
  static TextStyle get h3 => _base(18, FontWeight.w700);
  static TextStyle get h4 => _base(16, FontWeight.w600);

  // App bar title
  static TextStyle get appBarTitle =>
      _base(20, FontWeight.w700, color: AppColors.textOnPrimary);

  // Body
  static TextStyle get bodyLg => _base(16, FontWeight.w400);
  static TextStyle get bodyMd => _base(14, FontWeight.w400);
  static TextStyle get bodySm =>
      _base(13, FontWeight.w400, color: AppColors.textSecondary);

  // Emphasis
  static TextStyle get medium => _base(14, FontWeight.w500);
  static TextStyle get semiBold => _base(14, FontWeight.w600);
  static TextStyle get bold => _base(14, FontWeight.w700);

  // Buttons
  static TextStyle get button =>
      _base(15, FontWeight.w700, color: AppColors.textOnPrimary)
          .copyWith(letterSpacing: 0.4);
  static TextStyle get buttonOutline =>
      _base(15, FontWeight.w700, color: AppColors.primary)
          .copyWith(letterSpacing: 0.4);

  // Form labels (uppercase, tracked)
  static TextStyle get fieldLabel =>
      _base(12, FontWeight.w700, color: AppColors.textSecondary)
          .copyWith(letterSpacing: 0.6);
  static TextStyle get sectionLabel =>
      _base(13, FontWeight.w700, color: AppColors.textSecondary)
          .copyWith(letterSpacing: 1.0);

  // Table headers
  static TextStyle get tableHeader =>
      _base(12, FontWeight.w700, color: AppColors.textSecondary)
          .copyWith(letterSpacing: 0.4);

  // Input chrome
  static TextStyle get placeholder =>
      _base(15, FontWeight.w400, color: AppColors.textMuted);
  static TextStyle get inputText => _base(15, FontWeight.w400);

  // Stats
  static TextStyle get statValue => _base(34, FontWeight.w800);
  static TextStyle get statLabel =>
      _base(13, FontWeight.w600, color: AppColors.textSecondary)
          .copyWith(letterSpacing: 0.4);

  // Misc
  static TextStyle get caption =>
      _base(11, FontWeight.w400, color: AppColors.textMuted);
  static TextStyle get link =>
      _base(14, FontWeight.w700, color: AppColors.textPrimary);
}
