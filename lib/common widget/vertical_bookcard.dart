import 'package:audio_book/common%20widget/common_network_Image.dart';
import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VerticalBookCard extends StatelessWidget {
  final BookModel book;
  const VerticalBookCard({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizes.verticalCardHeight,
          width: AppSizes.verticalCardWidth,
          child:
             Card(
              clipBehavior: Clip.antiAlias,
              child: CommonNetworkImage(imageUrl:book.cover, )
              //Image.network(book.cover, fit: BoxFit.cover),
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(left:AppSizes.padding4),
          child: SizedBox(
            width: AppSizes.verticalCardTitleWidth,
            child: Text(
              book.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppSizes.padding4),
          child: Text(book.author),
        ),
      ],
    );
  }
}
