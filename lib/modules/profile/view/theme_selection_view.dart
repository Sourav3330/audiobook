import 'package:audio_book/app/theme/theme_controller.dart';
import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../app/theme/app_theme_mode.dart';

class ThemeSelectionView extends GetView<ThemeController> {
  const ThemeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: true),
      body: Column(
        children: [
          Obx(
            () => RadioGroup<AppThemeMode>(
              onChanged:(AppThemeMode? value){
                if(value!=null) {
                  controller.changeThemeMode(value);
                }
              },
              groupValue: controller.selectedThemeMode.value,
              child: Column(
                children: [
                  RadioListTile<AppThemeMode>(
                    title: const Text("System Default"),
                    value: AppThemeMode.system,
                  ),
                  RadioListTile<AppThemeMode>(
                    title: const Text("Light"),
                    value: AppThemeMode.light,
                  ),

                  RadioListTile<AppThemeMode>(
                    title: const Text("Dark"),
                    value: AppThemeMode.dark,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
