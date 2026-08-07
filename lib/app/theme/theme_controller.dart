import 'package:audio_book/app/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
 Rx<AppThemeMode>selectedThemeMode = AppThemeMode.system.obs;

 void changeThemeMode(AppThemeMode mode){
   selectedThemeMode.value =  mode;
   switch (mode){
     case AppThemeMode.system:
       Get.changeThemeMode(ThemeMode.system);
       break;
     case AppThemeMode.dark:
       Get.changeThemeMode(ThemeMode.dark);
       break;
     case AppThemeMode.light:
       Get.changeThemeMode(ThemeMode.light);
       break;

       
   }

 }

}