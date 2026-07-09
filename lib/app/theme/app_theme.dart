import 'package:audio_book/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

static ThemeData get light{
  
  final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    primary: AppColors.primary,
    surface:AppColors.surface,
    brightness: Brightness.light,
  );

  final base = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    colorScheme: scheme,
    textTheme: GoogleFonts.interTextTheme(),
  );
  return base.copyWith(

  );

  
}
}