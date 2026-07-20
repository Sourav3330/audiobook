import 'package:audio_book/common%20widget/ratings_widget.dart';
import 'package:audio_book/modules/playerScreen/controllers/player_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/theme/fonts.dart';
import '../app/theme/text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../helpers/durationFormater.dart';
import '../helpers/totalReviews.dart';
import 'chapter_listenbutton.dart';

class ChaptersScreen extends GetView<PlayerController>{
  const ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   FractionallySizedBox(
      heightFactor: 0.95,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.scaffoldBg,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(5),
          ),
        ),
        //information on cover
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //information on cover
              SizedBox(
                height:550,
                //information on cover
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: ClipRRect(
                        child:
                            CachedNetworkImage(imageUrl: controller.currentBook.value!.cover,
                              fit: BoxFit.cover, ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4)
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          //Ratings Row
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RatingsWidget(
                                rating: controller
                                    .currentBook
                                    .value!
                                    .rating,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                controller
                                    .currentBook
                                    .value!
                                    .rating
                                    .toString(),
                                style: TextStyles.poppins
                                    .copyWith(
                                  color:Colors.grey.shade400,
                                  fontWeight:
                                  FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              Text('(${TotalReviews.totalReviews(5100)} reviews)',
                                style: TextStyles.poppins
                                    .copyWith(
                                  color: Colors.grey.shade400,
                                  fontWeight:
                                  FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),

                          Text(controller.currentBook.value!.title,
                            style: TextStyle(fontWeight:FontWeight.w600,fontSize: 25,
                                color: AppColors.bannerTitle),),

                          Text(controller.currentBook.value!.author,
                            style: TextStyle(fontWeight:FontWeight.w300,fontSize: 15,
                                color: AppColors.chapterListBookAuthor,fontFamily: Fonts.poppins),),
                          const SizedBox(height: 20),
                          ChapterListenButton(onTap: (){}),
                          const SizedBox(height: 50,),
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
                              color: AppColors.surface
                          ),
                          child:
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                              spacing: 10,
                              children: [
                                Column(
                                  children: [
                                    Text('Duration',style: TextStyle(fontFamily: Fonts.poppins,color: AppColors.grayText),),
                                    const SizedBox(height: 5,),
                                    Text(Durationformater.formatDuration(controller.currentBook.value!.duration,),
                                      style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                ),
                                Container(
                                  width: 0.5,
                                  height: 45,
                                  color: AppColors.grayText,
                                ),
                                Column(
                                  children: [
                                    Text('Language',style: TextStyle(fontFamily: Fonts.poppins,color: AppColors.grayText),),
                                    const SizedBox(height: 5,),
                                    Text(controller.currentBook.value!.language,
                                      style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                )
                              ],),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Synopsys",style: TextStyles.listNames.copyWith(fontSize: 25),),
                    Text(controller.currentBook.value!.description,style: TextStyles.poppins.copyWith(fontSize: 12),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Chapters",style: TextStyles.listNames.copyWith(fontSize: 25),),
                        Text(AppStrings.seeAll,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: controller.playlist.take(3).map((chapter){
                        return
                          Obx(()=>
                              Card(
                                elevation: 0,
                                color:controller.currentChapter.value!.id==chapter.id?AppColors.primary: AppColors.surface,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(color:AppColors.chapterBorder  ,width: 1)),
                                child: ListTile(
                                  title: Text(chapter.title,style: TextStyle(color: controller.currentChapter.value!.id==chapter.id?AppColors.surface: AppColors.primary,),),
                                  subtitle: Text(Durationformater.formatDuration(chapter.duration),
                                    style: TextStyle(color: controller.currentChapter.value!.id==chapter.id?AppColors.surface: AppColors.primary,),),
                                  leading: Icon(Icons.play_circle_fill_rounded,color: controller.currentChapter.value!.id==chapter.id?AppColors.surface: AppColors.primary,),
                                ),
                              ),
                          );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),
                    Text(AppStrings.listenersReviews,style: TextStyles.listNames,),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}