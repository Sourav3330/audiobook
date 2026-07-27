import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class NextSongButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? size;
  final Color? color;
  const NextSongButton({super.key,
    required this.onTap,
    this.size,
    this.color,

    });
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      padding: EdgeInsets.zero,
      // style: IconButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.primary,
      // backgroundColor: Theme.of(context).colorScheme.surface),
      onPressed: onTap,
      icon: Icon(
        Icons.skip_next_rounded,
        //color:color ?? AppColors.primary,
        size: size,
      ),
    );
  }

}