
import 'package:audio_book/common%20widget/common_network_Image.dart';
import 'package:audio_book/common%20widget/ratings_widget.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/modules/playerScreen/controllers/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../helpers/durationFormater.dart';
import '../helpers/totalReviews.dart';
import 'chapter_listenbutton.dart';

class ChaptersScreen extends GetView<PlayerController> {
  const ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.95,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
        ),
        //information on cover
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //information on cover
              SizedBox(
                height: 550,
                //information on cover
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: ClipRRect(
                        child: CommonNetworkImage(
                          imageUrl: controller.currentBook.value!.cover,
                          borderRadius: 0,

                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Ratings Row
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RatingsWidget(
                                rating: controller.currentBook.value!.rating,
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Text(
                                controller.currentBook.value!.rating.toString(),
                                style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray400)
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Text(
                                '(${TotalReviews.totalReviews(5100)} reviews)',
                                style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray400)
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.md),
                          SizedBox(
                            width: 350,
                            child: Text(
                              controller.currentBook.value!.title,
                              style:  Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.bannerTitle,overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Text(
                            controller.currentBook.value!.author,
                            style:  Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.chapterListBookAuthor)

                          ),
                          const SizedBox(height: AppSpacing.lg),
                          ChapterListenButton(onTap: () {
                           controller.playBook(controller.currentBook.value!);
                          }),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 15,
                      right: 15,
                      bottom: 0,
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 25,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              spacing: 10,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.duration,
                                      style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray600)
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                        Durationformater.getDurationText(controller.currentBook.value!.duration),
                                      style:  Theme.of(context).textTheme.titleMedium
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 0.5,
                                  height: 45,
                                  color: AppColors.grayText,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.language,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray600)

                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      controller.currentBook.value!.language,
                                      style:  Theme.of(context).textTheme.titleMedium

                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //synopsis
                    Text(
                      AppStrings.synopsys,
                      style:  Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25,fontWeight: FontWeight.w500)
                    ),
                    Text(
                      controller.currentBook.value!.description,
                      style:  Theme.of(context).textTheme.bodyMedium
                    ),
                    SizedBox(height: AppSpacing.lg),
                    //chapters
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.chapters,
                          style:   Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25,fontWeight: FontWeight.w500)
                        ),
                        TextButton(
                          onPressed:(){
                            controller.toggleChapters();
                          },
                          child:
                          Text(
                          AppStrings.seeAll,
                          style: Theme.of(context).textTheme.titleSmall
                        ),
                        )
                      ],
                    ),
                    //chapters list
                    Obx(
                          () {
                            final chapters =   controller.viewChapters.value ?
                            controller.playlist : controller.playlist.take(3);
                            return
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children:

                           chapters.map((chapter) {
                              return
                                InkWell(onTap: (){
                                 controller.selectChapter(chapter.chapterNumber);
                                },
                                  child:
                                  Card(
                                  color:
                                  controller.currentChapter.value!.id ==
                                      chapter.id
                                      ? Theme.of(context).colorScheme.primary
                                      : AppColors.surface,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                      color:  Theme.of(context).colorScheme.onPrimary,
                                      width: 1,
                                    ),
                                  ),
                                  child:
                                  ListTile(
                                    tileColor: controller.currentChapter.value!.id ==
                                            chapter.id
                                            ?  Theme.of(context).colorScheme.primary
                                            :  Theme.of(context).colorScheme.surface,
                                    title: Text(
                                      chapter.title,
                                      style: Theme.of(context).listTileTheme.titleTextStyle?.copyWith(color:
                                        controller.currentChapter.value!.id ==
                                        chapter.id
                                        ?  Theme.of(context).colorScheme.onPrimary
                                            :  Theme.of(context).colorScheme.onSurface, )
                                    ),
                                    subtitle: Text(
                                      Durationformater.formatDuration(
                                        chapter.duration,
                                      ),
                                      style:
                                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color:
                                        controller.currentChapter.value!.id ==
                                            chapter.id
                                            ?  Theme.of(context).colorScheme.onPrimary
                                            : AppColors.gray700,
                                      ),
                                    ),
                                    leading:

                                    Icon(controller.currentChapter.value!.id==chapter.id?
                                     Icons.pause_circle: Icons.play_circle_fill_rounded,
                                      color:
                                      controller.currentChapter.value!.id == chapter.id
                                          ?  Theme.of(context).colorScheme.onPrimary
                                          : null,
                                    ),
                                  ),
                                  ),
                                );
                            }).toList(),
                          );

                        } ),
                    SizedBox(height: AppSpacing.lg),
                    //listeners Reviews
                    Text(
                      AppStrings.listenersReviews,
                      style:  Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25,fontWeight: FontWeight.w500)

                    ),
                    SizedBox(height: AppSpacing.sm,),
                    //Reviews List
                    SizedBox(
                      height: 150,
                      child: PageView.builder(
                          itemCount: controller.topReviews.length,
                          itemBuilder: (context,index){
                            var data =controller.topReviews[index];
                            return
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(AppSizes.padding8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(

                                    title: Text(
                                      data.userName,
                                      style:  Theme.of(context).listTileTheme.titleTextStyle
                                    ),
                                    subtitle: Text(
                                      data.date,
                                      style:  Theme.of(context).listTileTheme.subtitleTextStyle,
                                    ),
                                    leading: Icon(
                                      Icons.person,
                                      color:  Theme.of(context).colorScheme.onSurface,
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yelloPrimary,
                                          size: 20,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          data.rating
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 19,
                                    ),
                                    child: Text(
                                      data.review,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );}),
                    ),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
