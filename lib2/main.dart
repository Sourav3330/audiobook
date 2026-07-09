import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/bindings/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';
import 'constants/app_strings.dart';
import 'firebase_options.dart';

/// App entry point. Runs once at launch.
Future<void> main() async {
  // Required before using any plugins (Firebase) ahead of runApp().
  WidgetsFlutterBinding.ensureInitialized();

  // Connect to the Firebase project ('qr-inspect') using the generated config.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Always start on the splash screen; it checks the auth session and then
  // routes to the shell (logged in) or login.
  runApp(const QrInspectApp());
}

/// Root widget. `GetMaterialApp` (from GetX) replaces `MaterialApp` and adds
/// routing, dependency injection, and snackbar/dialog helpers.
class QrInspectApp extends StatelessWidget {
  const QrInspectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light, // Central Material theme (colors, fonts, inputs).
      initialBinding: InitialBinding(), // Registers app-wide controllers once.
      initialRoute: AppRoutes.splash, // First screen shown at launch.
      getPages: AppPages.routes, // The route table (name -> screen + binding).
      defaultTransition: Transition.cupertino, // iOS-style push animation.

    );
  }
}
