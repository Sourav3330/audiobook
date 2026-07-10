import 'package:audio_book/app/bindings/intial_binding.dart';
import 'package:audio_book/app/routes/app_pages.dart';
import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/app/theme/app_theme.dart';
import 'package:audio_book/common%20widget/auth_scaffoldCopy.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/modules/auth/views/login_view.dart';
import 'package:audio_book/modules/splash/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme:AppTheme.light,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      initialBinding: IntialBinding(),
      initialRoute: AppRoutes.login,

    );
  }
}
