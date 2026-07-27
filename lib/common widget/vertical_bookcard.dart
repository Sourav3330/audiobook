import 'package:audio_book/app/theme/fonts.dart';
import 'package:audio_book/common%20widget/common_network_Image.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/constants/app_strings.dart';
import 'package:audio_book/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VerticalBookCard extends StatelessWidget {
  final BookModel book;
  final double width;
  const VerticalBookCard({super.key, required this.book,
    this.width = AppSizes.verticalCardWidth,

  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizes.verticalCardImageHeight,
          width: width,
          child: Card(
            child: CommonNetworkImage(imageUrl: book.cover),
          ),
        ),
        const SizedBox(height: AppSpacing.xs,),
        SizedBox(
          width: AppSizes.verticalCardTitleWidth,
          child: Text(
            book.title,
            style:
            Theme.of(context).textTheme.titleMedium?.copyWith(overflow:TextOverflow.ellipsis)
          ),
        ),
        Text(
          book.author,
          style:  Theme.of(context).textTheme.bodyMedium),
         SizedBox(height: AppSpacing.xxs,),
        Row(
          children: [
            Text(
              AppStrings.moreDetails,
              style:
             Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight:FontWeight.w600)
            ),
            Icon(Icons.arrow_forward,color: Theme.of(context).colorScheme.primary,),
          ],
        ),
      ],
    );
  }
}
