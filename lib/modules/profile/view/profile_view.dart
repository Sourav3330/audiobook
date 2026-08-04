import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/common%20widget/common_settings_card.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisSize: MainAxisSize.values.last,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppSpacing.md),
              Text(
                "General",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.grayText),
              ),
              SizedBox(height: AppSpacing.sm),
              CommonSettingsCard(
                leadingIcon: Icons.notifications_none,
                trailing: Icon(Icons.keyboard_arrow_right,color: AppColors.gray600),
                title: "Push Notification",
                description: "Alert for new chapters and exclusive drops",
                onTap: () {
                  controller.goToPushNotification();
                },
              ),
              CommonSettingsCard(
                leadingIcon: Icons.privacy_tip_outlined,
                trailing: Icon(Icons.keyboard_arrow_right,color: AppColors.gray600),
                title: "Account Privacy",
                description: "Manage visibility and library sharing",
                onTap: () {
                  controller.goToPrivacy();
                },
              ),
               CommonSettingsCard(
                leadingIcon: Icons.dark_mode_outlined,
                trailing: Transform.scale(
                    scale: 0.9,
                    child: Switch(value: true, onChanged: (value){},)),
                title: "Dark Mode",
                description: "Switch between light and dark mode",
                onTap: () {},
              ),
              SizedBox(height: AppSpacing.md,),
              Text(
                "Security & Privacy",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.grayText),
              ),
              SizedBox(height: AppSpacing.sm,),
               CommonSettingsCard(
                leadingIcon: Icons.lock_outline,
                trailing: Icon(Icons.keyboard_arrow_right,color: AppColors.gray600),
                title: "App Lock",
                description: "Secure your library with a pin, pattern and biometric lock",
                onTap: () {
                  controller.goToAppLock();
                },
              ),
               CommonSettingsCard(
                leadingIcon: Icons.remove_red_eye_outlined,
                trailing: Icon(Icons.keyboard_arrow_right,color: AppColors.gray600),
                title: "Camouflage Mode",
                description: "Disguise the app icon and name on the home screen",
                onTap: () {},
              ),
              SizedBox(height: AppSpacing.md,),
              Text(
                "Support & Safety",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.grayText),
              ),
               SizedBox(height: AppSpacing.sm,),
               CommonSettingsCard(
                leadingIcon: Icons.help_center_outlined,
                trailing: Icon(Icons.keyboard_arrow_right,color: AppColors.gray600),
                title: "Help & Support",
                description: "FAQs, contact us, and community guidelines ",
                onTap: () {
                  controller.goToHelp();
                },
              ),
              CommonSettingsCard(
                leadingIcon: Icons.logout,
                trailing: Icon(Icons.keyboard_arrow_right,color: AppColors.gray600),
                title: "Log Out",
                description: "securely exit your session",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
