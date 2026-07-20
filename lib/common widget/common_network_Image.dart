import 'dart:convert';

import 'package:audio_book/common%20widget/placeholder_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget{
  final String imageUrl;
  final double borderRadius;

  const CommonNetworkImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = 12
});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(imageUrl:imageUrl,fit:BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration( milliseconds: 150),
          placeholder:(context,url)=>PlaceholderAnimation(),
          errorWidget: (context,url,error)=>Container(
            color: Colors.grey.shade300,
            child: Icon(Icons.menu_book,size: 40,),
          ),
        ));
  }
}