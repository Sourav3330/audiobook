import 'package:audio_book/app/bindings/intial_binding.dart';
import 'package:audio_book/app/routes/app_pages.dart';
import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/app/theme/app_theme.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/data/service/hiveServices/hive_intializer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   //intialize Hive
   await HiveInitializer.initializeHive();
   //Initialize Firebase
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return
      GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme:AppTheme.light,darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      initialBinding: IntialBinding(),
      initialRoute: AppRoutes.splash,
       // showPerformanceOverlay:true,


    );
  }
}
