import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class FeaturedTodayText extends StatelessWidget {

  final Color? backgroundColor;
  final Color? borderColor;
  const FeaturedTodayText({super.key,
    this.backgroundColor,
    this.borderColor,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(AppSizes.radius8),
        border: Border.all(color:borderColor ?? AppColors.featuredContainerBorder, width: 2),
        color: backgroundColor ?? AppColors.featuredContainerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child:const Center(
          child:  Text(
            AppStrings.featuredToday,
            style: TextStyle(color: AppColors.featuredContainerTextColor),
          ),
        ),
      ),
    );
  }
}
