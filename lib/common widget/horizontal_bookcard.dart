import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/data/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class HorizontalBookCard extends StatelessWidget {
  final BookModel book;
  const HorizontalBookCard({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: AppSizes.bookCardHeightSm,
          width: AppSizes.bookCardWidthSm,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Image.network(book.cover, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: AppSizes.padding20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: AppSpacing.xs),
            Text(book.author, style: TextStyle(color: AppColors.primary)),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: AppSizes.padding8),
          child: Icon(Icons.playlist_add),
        ),
      ],
    );
  }
}
