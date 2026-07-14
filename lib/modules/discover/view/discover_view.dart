import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/common%20widget/discover_banner.dart';
import 'package:audio_book/common%20widget/horizontal_bookcard.dart';
import 'package:audio_book/common%20widget/vertical_bookcard.dart';
import 'package:audio_book/constants/app_colors.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/modules/discover/controller/discover_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/theme/text_styles.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding4),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child:
                  DiscoverBanner(banners: controller.banners),
                ),
                SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: [
                      Text(AppStrings.newReleases, style: TextStyles.listNames),
                      Spacer(),
                      Text(
                        AppStrings.seeAll,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.sm),
                SizedBox(
                  height: AppSizes.verticalCardRowHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.newReleases.length,
                    itemBuilder: (context, index) {
                      var data = controller.newReleases[index];
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: VerticalBookCard(book: data),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    AppStrings.recommendedForYou,
                    style: TextStyles.listNames,
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: controller.recommended.length,
                  itemBuilder: (context, index) {
                    var data = controller.recommended[index];
                    return HorizontalBookCard(book: data);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
