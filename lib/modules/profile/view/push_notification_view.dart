import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/common%20widget/common_settings_card.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/modules/profile/controller/push_notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class PushNotificationView extends GetView<PushNotificationController> {
  const PushNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar:  CommonAppbar(showBackButton: true),
      body:Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: AppColors.gray500),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: AppSpacing.md),
                    child: Row(
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Notifications",
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                "Get notified whenever new book or albums released",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray700),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      Obx(()=>
                          Switch(
                            value: controller.getNotifications.value,
                            onChanged: (value){
                              controller.requestPermission(value);
                          },
                          ),
                      ),
                        SizedBox(width: 20,)
                      ],
                    ),
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