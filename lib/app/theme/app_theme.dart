import 'package:audio_book/app/theme/text_styles.dart';
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
    //textTheme: GoogleFonts.abhayaLibreTextTheme(),
  );
  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme().copyWith(

      displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.primary),
      displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.primary),
      displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.primary),

      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: AppColors.primary),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.primary),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(color: AppColors.primary),

      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.primary),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.primary),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.primary),

      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.primary),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.primary),

      labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.primary),

    ),
    buttonTheme:ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),

    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            shape:  WidgetStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                )
            )
        )
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,

    )
  );
}

//dark theme
static ThemeData get dark{

  final scheme = ColorScheme.fromSeed(
      seedColor: Colors.blue,
    primary: Colors.blue,
    surface:Colors.blueGrey,
    brightness: Brightness.dark,
  );

  final base = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    colorScheme: scheme,
    textTheme: GoogleFonts.abhayaLibreTextTheme(),
  );
  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme().copyWith(

      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,

      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,

      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,

      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,

      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),


  );


}
}