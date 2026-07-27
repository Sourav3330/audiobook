import 'package:audio_book/constants/app_sizes.dart';
import 'package:audio_book/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/app_colors.dart';

class HorizontalBookCard extends StatelessWidget {
  final BookModel book;
  const HorizontalBookCard({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return ListTile(

      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading:   SizedBox(
              height: AppSizes.bookCardHeightSm,
              width: AppSizes.bookCardWidthSm,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child:CachedNetworkImage(imageUrl: book.cover,fit: BoxFit.cover,)
              ),
            ),
      title: Text(
                  book.title,
                  style:  Theme.of(context).listTileTheme.titleTextStyle,),
      subtitle:  Text(book.author, style:  Theme.of(context).listTileTheme.subtitleTextStyle,),
      trailing:IconButton(onPressed: (){}, icon:Icon(Icons.playlist_add,color: Theme.of(context).colorScheme.primary,)),
    );

  }
}
