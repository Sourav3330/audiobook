import 'package:flutter/material.dart';

/// Spacing, radius, and field-sizing constants. Shared across every module so
/// visual rhythm stays consistent.
class AppSizes {
  AppSizes._();

  // Spacing
  static const double padding4 = 4;
  static const double padding8 = 8;
  static const double padding12 = 12;
  static const double padding16 = 16;
  static const double padding20 = 20;
  static const double padding24 = 24;
  static const double padding32 = 32;
  static const double padding40 = 40;
  static const double padding48 = 48;

  // Radius
  static const double radius4 = 4;
  static const double radius8 = 8;
  static const double radius10 = 10;
  static const double radius12 = 12;
  static const double radius16 = 16;
  static const double radius24 = 24;

  // Navigation / app bar
  static const double bottomNavHeight = 60;
  static const double appBarHeight = kToolbarHeight;

  // Form field
  static const double inputHeight = 56;
  static const double inputContentPaddingVertical = 17;
  static const double textareaMinHeight = 96;
  static const double buttonHeight = 54;

  // Card
  static const double cardElevation = 0;
  static const double bookCardHeightSm = 70;
  static const double bookCardWidthSm = 70;

  static const double verticalCardHeight = 250;
  static const double verticalCardWidth = 150;
  static const double verticalCardTitleWidth = 130;
  static const double verticalCardRowHeight = 320;


  // Avatars / icons
  static const double avatarSm = 32;
  static const double avatarMd = 44;
  static const double avatarLg = 88;
  static const double brandIcon = 72;
}

/// Semantic spacing aliases — keeps callers self-documenting.
class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}
