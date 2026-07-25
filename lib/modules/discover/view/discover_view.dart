import 'package:audio_book/common%20widget/common_appbar.dart';
import 'package:audio_book/common%20widget/discover_banner.dart';
import 'package:audio_book/common%20widget/horizontal_bookcard.dart';
import 'package:audio_book/common%20widget/vertical_bookcard.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/modules/discover/controller/discover_controller.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
        child: CustomScrollView(
          slivers: [
            //SliverPadding(padding: EdgeInsetsGeometry.all(AppSizes.padding20)),
            SliverToBoxAdapter(
              child: DiscoverBanner(
                banners: controller.banners,
                detailOnTap: controller.viewSong,
                playOnTap: controller.playBook,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),
            SliverToBoxAdapter(
              child:  Row(
                  children: [
                    Text(AppStrings.newReleases,style: Get.textTheme.titleLarge,),
                    Spacer(),
                    Text(
                      AppStrings.seeAll,
                      style: Get.textTheme.titleSmall
                    ),
                  ],
                ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sm)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 380,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.newReleases.length,
                  itemBuilder: (context, index) {
                    var data = controller.newReleases[index];
                    final width = ((MediaQuery.of(context)).size.width-30)/2;
                    return InkWell(onTap: (){
                      controller.viewSong(data);
                    },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: VerticalBookCard(book: data,width: width,),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:SizedBox(height: AppSpacing.md,),
            ),
            //recommended for you
            SliverToBoxAdapter(
                child: Text(
                  AppStrings.recommendedForYou,style: Get.textTheme.titleLarge,
                ),
              ),

            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sm)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.recommended.length,
                (context, index) {
                  var data = controller.recommended[index];
                  return InkWell(
                      onTap: (){
                        controller.viewSong(data);
                      },
                      child: HorizontalBookCard(book: data));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
