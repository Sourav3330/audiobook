import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/common%20widget/featuredtoday_text.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/modules/discover/controller/songDetail_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SongDetail extends GetView<SongDetailController> {
  const SongDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      child: Image.network(
                        controller.book.cover,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: const [Colors.black38, AppColors.scaffoldBg],
                        stops: const [0.1, 1],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FeaturedTodayText(
                          backgroundColor: AppColors.primary,
                          borderColor: AppColors.primary,
                        ),
                        SizedBox(height: AppSpacing.md),
                        SizedBox(
                          width: 350,
                          child: Text(
                            '${controller.words.first}\n${controller.words.skip(1).join('')}',
                            style: TextStyle(
                              height: 1.2,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              fontSize: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Narrated by ${controller.book.author}",
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.songDetailAuthor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: AppColors.surface,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "Narrator",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(controller.book.author),
                      ),
                      ListTile(
                        leading: Icon(Icons.timer),
                        title: Text(
                          'Duration',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          controller.getDuration(controller.book.duration),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.menu_book),
                        title: Text(
                          'Genre',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(controller.book.author),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Synopsis",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 8),
              child: Text(controller.book.description),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Listen now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.songDetailLikeSurface,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icon/heart.svg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
