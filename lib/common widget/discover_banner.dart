import 'package:audio_book/common%20widget/featuredtoday_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../app/theme/text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../data/models/book_model.dart';

class DiscoverBanner extends StatelessWidget {
  final List<BookModel> banners;
  final void Function(BookModel book) detailOnTap;
  final void Function(BookModel book, String bookId) playOnTap;
  const DiscoverBanner({super.key,
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
              Image.network(banner.cover, fit: BoxFit.cover),
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
                top: 200,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturedTodayText(),
                    SizedBox(
                      width: 350,
                      child: Text(
                        banner.title,
                        style: TextStyles.listNames.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.scaffoldBg,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Text(
                      banner.author,
                      style: TextStyles.listNames.copyWith(
                        color: AppColors.scaffoldBg,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        InkWell(
                          onTap:() {
                            detailOnTap(banner);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 1,
                                color: AppColors.yelloPrimary,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "View Details",
                                  style: TextStyle(color: AppColors.yelloPrimary),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: (){
                            playOnTap(banner,banner.id);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Play Now",
                                  style: TextStyle(
                                    color: AppColors.featuredContainerTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
        autoPlayInterval: Duration(seconds: 4),
        height: 400,
        viewportFraction: 1,
      ),
    );
  }
}
