import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';

/// Branded launch screen shown while [SplashController] checks the auth state
/// and routes to the app or the login screen.
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Centered brand mark + title.
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // White rounded square with the clipboard icon in brand green.
                  Container(
                    width: AppSizes.avatarLg,
                    height: AppSizes.avatarLg,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radius16),
                    ),
                    child: const Icon(
                      Icons.assignment_turned_in_outlined,
                      size: 46,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.appName,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1.copyWith(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    AppStrings.inspectionSystem,
                    style: AppTextStyles.bodyMd.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            // Loading indicator near the bottom.
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: AppSizes.padding48),
                child: SizedBox(
                  width: 26,
                  height: 26,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
