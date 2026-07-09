import 'package:flutter/material.dart';

/// Centralised colour palette for the Inspector app. Derived from the Figma
/// mocks — a deep green primary on light-grey surfaces with cool-lavender
/// input fills.
class AppColors {
  AppColors._();

  // ── Brand ────────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF0E6B4E);
  static const Color primaryDark = Color(0xFF0A573F);
  static const Color primaryAccent = Color(0xFF118A5F);
  static const Color primaryLight = Color(0xFFD9F0E5);

  // ── Surfaces ─────────────────────────────────────────────────────────────
  static const Color scaffoldBg = Color(0xFFF6F7F8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color inputFill = Color(0xFFF3F4FA);
  static const Color subtleBg = Color(0xFFF8F9FB);
  static const Color tableHeaderBg = Color(0xFFF1F2F4);

  // Scanner viewport tint (sage green wash behind the QR frame).
  static const Color scannerBg = Color(0xFFDCEAE2);
  static const Color scannerWindow = Color(0xFFE3EFE8);

  // ── Borders / dividers ───────────────────────────────────────────────────
  static const Color divider = Color(0xFFE3E5EC);
  static const Color border = Color(0xFFD8DBE3);
  static const Color navBarBorder = Color(0xFFE3E5EC);

  // ── Text ─────────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1A1D1F);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Colors.white;

  // ── Status / feedback ────────────────────────────────────────────────────
  static const Color success = Color(0xFF15803D);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFC0392B);
  static const Color info = Color(0xFF3B82F6);
  static const Color progressTrack = Color(0xFFE5E7EB);

  // ── Misc ─────────────────────────────────────────────────────────────────
  static const Color shadow = Color(0x14000000);
  static const Color overlay = Color(0x66000000);
  static const Color avatarBg = Color(0xFFE5E7EB);
}
