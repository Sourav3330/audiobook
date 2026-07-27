import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PreviousSongButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? size;
  final Color? color;

  const PreviousSongButton({super.key,
    required this.onTap,
    this.size,
    this.color,

  });
  @override
  Widget build(BuildContext context) {
    return  IconButton(

      padding: EdgeInsets.zero,
    //   style: IconButton.styleFrom(
    // backgroundColor: Theme.of(context).colorScheme.surface,
    // foregroundColor: Theme.of(context).colorScheme.primary,
    // padding: EdgeInsets.zero,),
      onPressed: onTap,
      icon: Icon(

        Icons.skip_previous_rounded,
        //color:color ?? AppColors.primary,
        size: size,
      ),
    );
  }

}