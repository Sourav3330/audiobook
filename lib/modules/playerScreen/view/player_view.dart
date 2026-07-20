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
                      const Text(
                        'PICK UP WHERE YOU LEFT OFF',
                        style: TextStyle(
                          fontFamily: Fonts.poppins,
                          color: AppColors.chapterCardTitle,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Obx(
                        () => SizedBox(
                          width: 350,
                          child: Text(
                            "Chapter ${controller.currentChapter.value?.chapterNumber}: ${controller.currentChapter.value?.title}",
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: Fonts.poppins,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: AppColors.surface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Book Cover card
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(imageUrl: controller.currentBook.value!.cover,
                  fit: BoxFit.cover,)
              ),
            ),
            const SizedBox(height: 9),

            //Book Title and Author name
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
                  Obx(
                    () => Text(
                      '${controller.currentBook.value!.author} : Ch ${controller.currentChapter.value!.chapterNumber} of ${controller.currentBook.value!.totalChapters}',
                      style: TextStyle(
                        color: AppColors.playerAuthor,
                        fontSize: 15,
                        fontFamily: Fonts.poppins,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Durationformater.formatDuration(
                        controller.position.value,
                      ),
                      style: TextStyle(fontFamily: Fonts.poppins, fontSize: 12),
                    ),
                    Text(
                      Durationformater.formatDuration(
                        controller.duration.value,
                      ),
                      style: TextStyle(fontFamily: Fonts.poppins, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            // Controll buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PreviousSongButton(
                  onTap: () {
                    controller.skipPrevious();
                  },
                  size: 50,
                ),
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
                 NextSongButton(
                  onTap: () {
                    controller.skipNext();
                  },
                  size: 50,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5),
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
                       Text(
                        '1.25x',
                        style: TextStyles.poppins.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      ChaptersScreen()
                    );
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.menu, color: AppColors.primary, size: 25),
                      Text(
                        'Chapters',
                        style: TextStyles.poppins.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Column(
                    children: [
                      Image.asset(
                        'assets/icon/language.png',
                        height: 25,
                        width: 25,
                      ),
                      Text(
                        'Language',
                        style: TextStyles.poppins.copyWith(fontSize: 10),
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
