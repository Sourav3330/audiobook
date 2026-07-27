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

        displayLarge: AppTextStyles.displayLarge.copyWith(color: scheme.primary),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: scheme.primary),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: scheme.primary),

        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: scheme.primary),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: scheme.primary),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(color: scheme.primary),

        titleLarge: AppTextStyles.titleLarge.copyWith(color: scheme.primary),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: scheme.primary),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: scheme.primary),

        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: scheme.primary),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: scheme.primary),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: scheme.primary),

        labelLarge: AppTextStyles.labelLarge.copyWith(color: scheme.primary),
        labelMedium: AppTextStyles.labelMedium.copyWith(color: scheme.primary),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: scheme.primary),

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

      ),
      iconTheme: IconThemeData(
        color: AppColors.primary,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.primary,
        dense: true,
        textColor: scheme.primary,
        subtitleTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray700),
        titleTextStyle: AppTextStyles.titleSmall.copyWith(color: scheme.primary),
        leadingAndTrailingTextStyle:TextStyle(color: scheme.primary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.primary,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color:  scheme.primary, size: 28);
          }
          return const IconThemeData(color: Colors.grey, size: 24);
        }),
        indicatorColor: scheme.primary,
        labelTextStyle:
        WidgetStateProperty.resolveWith((states) {
          return AppTextStyles.labelMedium.copyWith(
            color: states.contains(WidgetState.selected)
                ? scheme.primary
                : AppColors.gray500,
          );
        }),
      )
  );
}

//dark theme
static ThemeData get dark{

  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.darkPrimary,
    primary: AppColors.darkPrimary,
    surface:AppColors.darkSurface,
    brightness: Brightness.dark,
  );

  final base = ThemeData(
    scaffoldBackgroundColor: AppColors.darkScaffoldBg,
    colorScheme: scheme,
    //textTheme: GoogleFonts.abhayaLibreTextTheme(),
  );
  return base.copyWith(
      textTheme: GoogleFonts.interTextTheme().copyWith(

        displayLarge: AppTextStyles.displayLarge.copyWith(color: scheme.primary),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: scheme.primary),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: scheme.primary),

        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: scheme.primary),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: scheme.primary),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(color: scheme.primary),

        titleLarge: AppTextStyles.titleLarge.copyWith(color: scheme.primary),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: scheme.primary),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: scheme.primary),

        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: scheme.primary),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: scheme.primary),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: scheme.primary),

        labelLarge: AppTextStyles.labelLarge.copyWith(color: scheme.primary),
        labelMedium: AppTextStyles.labelMedium.copyWith(color: scheme.primary),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: scheme.primary),

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
        color: scheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,

      ),
      iconTheme: IconThemeData(
        color: AppColors.primary,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.primary,
        dense: true,
        textColor: scheme.primary,
        subtitleTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray700),
        titleTextStyle: AppTextStyles.titleSmall.copyWith(color: scheme.primary),
        leadingAndTrailingTextStyle:TextStyle(color: scheme.primary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.primary,
      ),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: scheme.surface,
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color:  scheme.primary, size: 28);
            }
            return const IconThemeData(color: Colors.grey, size: 24);
          }),
          indicatorColor: scheme.primary,
        labelTextStyle:
        WidgetStateProperty.resolveWith((states) {
          return AppTextStyles.labelMedium.copyWith(
            color: states.contains(WidgetState.selected)
                ? scheme.primary
                : AppColors.gray500,
          );
        }),
      )
  );

}
}