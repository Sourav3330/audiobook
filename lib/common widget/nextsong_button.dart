import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class NextSongButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? size;
  const NextSongButton({super.key,
    required this.onTap,
    this.size

    });
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.skip_next_rounded,
        color: AppColors.primary,
        size: size,
      ),
    );
  }

}