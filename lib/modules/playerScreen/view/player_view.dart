import 'dart:io';

import 'package:audio_book/app/theme/fonts.dart';
import 'package:audio_book/common%20widget/chapter_listenbutton.dart';
import 'package:audio_book/common%20widget/chapters_screen.dart';
import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/common%20widget/nextsong_button.dart';
import 'package:audio_book/common%20widget/playpause_button.dart';
import 'package:audio_book/common%20widget/previoussong_button.dart';
import 'package:audio_book/common%20widget/ratings_widget.dart';
import 'package:audio_book/common%20widget/speed_tile.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/helpers/durationFormater.dart';
import 'package:audio_book/helpers/totalReviews.dart';
import 'package:audio_book/modules/playerScreen/controllers/player_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';

import '../../../app/theme/text_styles.dart';

class PlayerView extends GetView<PlayerController> {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Player top card shows information of current chapter
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
                        AppStrings.pickMeWhereYouLeftOff,
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: AppColors.chapterCardTitle,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Obx(
                        () => SizedBox(
                          width: 350,
                          child: Text(
                            "${AppStrings.chapter} ${controller.currentChapter.value?.chapterNumber}: ${controller.currentChapter.value?.title}",
                            style: Get.textTheme.titleLarge?.copyWith(
                              color: AppColors.surface,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSpacing.md),
            //Book Cover card
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Card(
                elevation: AppSizes.cardElevation10,
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: controller.currentBook.value!.cover,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            //Book Title and Author name

                 Text(
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  controller.currentBook.value!.title,
                  style: Get.textTheme.headlineSmall?.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            Obx(
              () => Text(
                '${controller.currentBook.value!.author} : Ch ${controller.currentChapter.value!.chapterNumber} of ${controller.currentBook.value!.totalChapters}',
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: AppColors.playerAuthor,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            //Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                overlayShape: SliderComponentShape.noOverlay,
                trackHeight: 4,
              ),
              child: Obx(
                () => Slider(
                  inactiveColor: AppColors.sliderInactive,
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
            //song current Position and Duration values
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(AppSizes.padding8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //position duration
                    Text(
                      Durationformater.formatDuration(
                        controller.position.value,
                      ),
                      style: Get.textTheme.bodySmall,
                    ),
                    //max duration
                    Text(
                      Durationformater.formatDuration(
                        controller.duration.value,
                      ),
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            // Controll buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //previous song button
                PreviousSongButton(
                  onTap: () {
                    controller.skipPrevious();
                  },
                  size: 50,
                ),
                //back10sec button
                IconButton(
                  onPressed: () {
                    controller.backWard10();
                  },
                  icon: Image.asset(
                    'assets/icon/backward10second.png',
                    color: AppColors.primary,
                    height: 30,
                    width: 30,
                  ),
                ),
                //play pause botton
                Obx(
                  () => PlayPauseButton(
                    isLoading: controller.isLoading.value,
                    onTap: () {
                      controller.togglePlayPause();
                    },
                    isPlaying: controller.isPlaying.value,
                    size: 90,
                  ),
                ),
                //forward 10 sec button
                IconButton(
                  onPressed: () {
                    controller.forWard10();
                  },
                  icon: Image.asset(
                    'assets/icon/forward10second.png',
                    height: 30,
                    width: 30,
                    color: AppColors.primary,
                  ),
                ),
                //next song button
                NextSongButton(
                  onTap: () {
                    controller.skipNext();
                  },
                  size: 50,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            //speed,chapter,language button
            Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //speed button
                IconButton(
                  padding: EdgeInsets.zero,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.all(AppSizes.padding20),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppSizes.radius4),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SpeedTile(value: 0.5),
                            const SpeedTile(value: 0.75),
                            const SpeedTile(value: 1.0, title: "(Normal)"),
                            const SpeedTile(value: 1.25),
                            const SpeedTile(value: 1.5),
                            const SpeedTile(value: 2.0),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.speed, color: AppColors.primary, size: 25),
                      Obx(
                        () => Text(
                          "${controller.currentSpeed.value.toString()} X",
                          style: Get.textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //chapters button
                IconButton(
                  highlightColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.bottomSheet(isScrollControlled: true, ChaptersScreen());
                  },

                  icon: Column(
                    children: [
                      Icon(Icons.menu, color: AppColors.primary, size: 25),
                      Text(
                        AppStrings.chapters,
                        style: Get.textTheme.bodySmall?.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                //language button
                IconButton(
                  padding: EdgeInsets.zero,
                  highlightColor: Colors.transparent,

                  onPressed: () {},
                  icon: Column(
                    children: [
                      Image.asset(
                        'assets/icon/language.png',
                        height: 25,
                        width: 25,
                      ),
                      Text(
                        AppStrings.language,
                        style: Get.textTheme.bodySmall?.copyWith(fontSize: 10),
                      ),
                    ],
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
