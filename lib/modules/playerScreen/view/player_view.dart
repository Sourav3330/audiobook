import 'dart:io';

import 'package:audio_book/app/theme/fonts.dart';
import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/helpers/durationFormater.dart';
import 'package:audio_book/modules/playerScreen/controllers/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';

class PlayerView extends GetView<PlayerController> {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: AppColors.chapterCard,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.padding20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PICK UP WHERE YOU LEFT OFF',
                        style: TextStyle(
                          fontFamily: Fonts.poppins,
                          color: AppColors.chapterCardTitle,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Chapter ${controller.currentChapter.value?.chapterNumber}:${controller.currentChapter.value?.title}",
                        style: TextStyle(
                          fontFamily: Fonts.poppins,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.surface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  controller.currentBook.value!.cover,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 9),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.currentBook.value!.title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    '${controller.currentBook.value!.author} : Ch ${controller.currentChapter.value!.chapterNumber} of ${controller.currentBook.value!.totalChapters}',
                    style: TextStyle(
                      color: AppColors.playerAuthor,
                      fontSize: 15,
                      fontFamily: Fonts.poppins,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                overlayShape: SliderComponentShape.noOverlay,
                trackHeight: 4,
              ),
              child: Obx(
                    () => Slider(
                  value: controller.position.value.inSeconds.toDouble(),
                  max: controller.duration.value.inSeconds.toDouble() > 0
                      ? controller.duration.value.inSeconds.toDouble()
                      : 1,
                  onChanged: (value) {
                    controller.seek(Duration(seconds: value.toInt()));
                  },
                ),
              ),
            ),
            Obx(()=>
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Durationformater.formatDuration(controller.position.value),style: TextStyle(fontFamily: Fonts.poppins,fontSize: 12),
                    ),
                    Text(
                      Durationformater.formatDuration(controller.duration.value),style: TextStyle(fontFamily: Fonts.poppins,fontSize: 12),
                    ),
                  ],
                               ),
               ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_rounded,
                    color: AppColors.primary,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icon/backward10second.png',
                    color: AppColors.primary,
                    height: 30,
                    width: 30,
                  ),
                ),
                Obx(
                  () => IconButton(
                    onPressed: () {
                      controller.togglePlayPause();
                    },
                    icon: controller.isPlaying.value == true
                        ? Icon(
                            Icons.pause_circle_rounded,
                            color: AppColors.primary,
                            size: 90,
                          )
                        : Icon(
                            Icons.play_circle_fill_rounded,
                            color: AppColors.primary,
                            size: 90,
                          ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icon/forward10second.png',
                    height: 30,
                    width: 30,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next_rounded,
                    color: AppColors.primary,
                    size: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
