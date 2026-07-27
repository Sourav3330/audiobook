import 'package:audio_book/common%20widget/common_network_Image.dart';
import 'package:audio_book/common%20widget/featuredtoday_text.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../app/theme/text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../data/models/book_model.dart';

class DiscoverBanner extends StatelessWidget {
  final List<BookModel> banners;
  final void Function(BookModel book) detailOnTap;
  final void Function(BookModel book) playOnTap;
  const DiscoverBanner({
    super.key,
    required this.banners,
    required this.detailOnTap,
    required this.playOnTap,
  });
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners.map((banner) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CommonNetworkImage(imageUrl: banner.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Colors.transparent, Colors.black],
                    center: Alignment.center,
                    stops: [0, 1],
                    radius: 1,
                  ),
                ),
              ),
              Positioned(
                top: 400,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturedTodayText(),
                    SizedBox(
                      width: 350,
                      child: Text(
                        banner.title,
                        style:  Theme.of(context).textTheme.headlineLarge?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.bannerTitle,
                        ),
                      ),
                    ),
                    Text(
                      banner.author,
                      style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.scaffoldBg,
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        //view detail button
                        TextButton(
                          onPressed: () {
                            detailOnTap(banner);
                          },
                          style:  Theme.of(context).textButtonTheme.style?.copyWith(
                            side: WidgetStatePropertyAll(
                              BorderSide(color: AppColors.yelloPrimary),
                            ),
                          ),
                          child: Text(
                            AppStrings.viewDetailButton,
                            style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.yelloPrimary,
                            ),
                          ),
                        ),

                        SizedBox(width: 10),
                        //play button
                        TextButton(
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.primary),side: WidgetStatePropertyAll(BorderSide(width: 1))),
                          child: Text(AppStrings.playNowButton,style:  Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.featuredContainerTextColor)),
                          onPressed: (){
                            playOnTap(banner);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 7),
        height: 600,
        viewportFraction: 1,
      ),
    );
  }
}
