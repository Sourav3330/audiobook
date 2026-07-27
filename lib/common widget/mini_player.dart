import 'package:audio_book/common%20widget/nextsong_button.dart';
import 'package:audio_book/common%20widget/playpause_button.dart';
import 'package:audio_book/common%20widget/previoussong_button.dart';
import 'package:audio_book/modules/playerScreen/controllers/player_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/theme/fonts.dart';
import '../constants/app_colors.dart';
import '../helpers/durationFormater.dart';
import 'common_network_Image.dart';
import 'common_slider.dart';

class MiniPlayer extends GetView<PlayerController> {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 10,
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Book Cover
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: CommonNetworkImage(
                      imageUrl: controller.player.currentBook.value!.cover,
                      borderRadius: 10,
                    ),
                  ),
                ),
                //Title & Slider
                Expanded(
                  child:
                Padding(
                  padding: const EdgeInsets.symmetric(
                     horizontal: 8.0,
                  ),
                    //title & Slider

                        child: SizedBox(
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //title
                              SizedBox(
                                width: 190,
                                child: Text(
                                  controller.player.currentChapter.value!.title,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(overflow: TextOverflow.ellipsis,)
                                ),
                              ),
                               Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //slider
                                    Expanded(
                                      child: CommonSlider(
                                        active: Theme.of(context).colorScheme.primary,
                                        miniPlayer: true,
                                        value: controller.player.position.value.inSeconds
                                            .toDouble(),
                                        max: controller.player.duration.value.inSeconds
                                            .toDouble(),
                                        onChanged: (value) {
                                          controller.player.seek(
                                            Duration(seconds: value.toInt()),
                                          );
                                        },

                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                     SizedBox(
                                       width: 37,

                                          child: Text(
                                            textAlign: TextAlign.left,
                                            Durationformater.formatDuration(
                                              controller.player.position.value,
                                            ),
                                            style:GoogleFonts.inter(
                                              fontSize: 12,
                                              color: AppColors.surface

                                            ),
                                              //TextStyle(fontFamily: Fonts.poppins, fontSize: 12,color: AppColors.miniPlayerDuration),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 1),
                                      child: Text('/',style: TextStyle(color: AppColors.surface),),
                                    ),
                                    Text(
                                      Durationformater.formatDuration(
                                        controller.player.duration.value,
                                      ),
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: AppColors.surface

                                      ),
                                    )

                                  ],
                                ),
                            ],
                          ),
                        ),

                    ),
                  ),

                //controll buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  PreviousSongButton(onTap: controller.skipPrevious,color: Theme.of(context).colorScheme.onPrimary),
                  PlayPauseButton(
                    size: 40,
                    onTap: () {
                      controller.togglePlayPause();
                    },
                    isPlaying: controller.isPlaying.value,
                    isLoading: controller.isLoading.value,
                    miniPlayer: true,
                  ),
                  NextSongButton(onTap: controller.skipNext,
                    color: Theme.of(context).colorScheme.onPrimary),
                ],)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
