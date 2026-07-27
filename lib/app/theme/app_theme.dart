import 'package:audio_book/app/theme/text_styles.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

static ThemeData get light{

  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    surface:AppColors.surface,
    onSurface: AppColors.primary,
    brightness: Brightness.light,
  );

  final base = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    colorScheme: scheme,
    //textTheme: GoogleFonts.abhayaLibreTextTheme(),
  );
  return base.copyWith(
      textTheme: GoogleFonts.interTextTheme().copyWith(

        displayLarge: AppTextStyles.displayLarge.copyWith(color: scheme.onSurface),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: scheme.onSurface),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: scheme.onSurface),

        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: scheme.onSurface),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: scheme.onSurface),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(color: scheme.onSurface),

        titleLarge: AppTextStyles.titleLarge.copyWith(color: scheme.onSurface),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: scheme.onSurface),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: scheme.onSurface),

        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: scheme.onSurface),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: scheme.onSurface),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: scheme.onSurface),

        labelLarge: AppTextStyles.labelLarge.copyWith(color: scheme.onSurface),
        labelMedium: AppTextStyles.labelMedium.copyWith(color: scheme.onSurface),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: scheme.onSurface),

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
      ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: scheme.surface,
      dragHandleColor: scheme.primary,
    ),
      inputDecorationTheme:InputDecorationThemeData(
          filled: true,
          fillColor: scheme.surface,
          iconColor: scheme.primary,
          prefixIconColor: scheme.primary,
          suffixIconColor: scheme.primary
      ),
      iconButtonTheme: IconButtonThemeData(
        style:ButtonStyle(backgroundColor: WidgetStatePropertyAll(base.scaffoldBackgroundColor),
            iconColor: WidgetStatePropertyAll(scheme.primary),foregroundColor: WidgetStatePropertyAll(scheme.primary)),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.colorOnPrimary,
  )
  );
}

//dark theme
static ThemeData get dark{

  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.darkPrimary,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    surface:AppColors.darkSurface,
    onSurface:AppColors.darkOnSurface,
    brightness: Brightness.dark,
  );

  final base = ThemeData(
    scaffoldBackgroundColor: AppColors.darkScaffoldBg,
    colorScheme: scheme,
    //textTheme: GoogleFonts.abhayaLibreTextTheme(),
  );
  return base.copyWith(
      textTheme: GoogleFonts.interTextTheme().copyWith(

        displayLarge: AppTextStyles.displayLarge.copyWith(color: scheme.onSurface),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: scheme.onSurface),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: scheme.onSurface),

        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: scheme.onSurface),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: scheme.onSurface),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(color: scheme.onSurface),

        titleLarge: AppTextStyles.titleLarge.copyWith(color: scheme.onSurface),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: scheme.onSurface),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: scheme.onSurface),

        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: scheme.onSurface),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: scheme.onSurface),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: scheme.onSurface),

        labelLarge: AppTextStyles.labelLarge.copyWith(color: scheme.onSurface),
        labelMedium: AppTextStyles.labelMedium.copyWith(color: scheme.onSurface),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: scheme.onSurface),

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
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        dragHandleColor: scheme.primary,
      ),
    inputDecorationTheme:InputDecorationThemeData(
      filled: true,
      fillColor: scheme.surface,
      iconColor: scheme.primary,
      prefixIconColor: scheme.primary,
      suffixIconColor: scheme.primary,

    ),
    iconButtonTheme: IconButtonThemeData(
      style:ButtonStyle(backgroundColor: WidgetStatePropertyAll(base.scaffoldBackgroundColor),
      iconColor: WidgetStatePropertyAll(scheme.primary),foregroundColor: WidgetStatePropertyAll(scheme.primary)),
    ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.colorOnPrimary,
      )

  );

}
}