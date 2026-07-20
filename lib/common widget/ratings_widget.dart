import 'package:audio_book/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RatingsWidget extends StatelessWidget {
  final double rating;
  const RatingsWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star,color:  AppColors.yelloPrimary,);
        } else if (index < rating) {
          return const Icon(Icons.star_half,color:  AppColors.yelloPrimary,);
        } else {
          return const Icon(Icons.star_border,color: Colors.grey,);
        }
      }
      ),
    );
  }
}
