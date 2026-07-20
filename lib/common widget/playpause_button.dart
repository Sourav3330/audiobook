import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PlayPauseButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? size;
  final bool isPlaying;

  const PlayPauseButton({super.key,
    required this.onTap,
    required this.isPlaying,
    this.size

  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:onTap,
      icon: isPlaying == true
          ? Icon(
        Icons.pause_circle_rounded,
        color: AppColors.primary,
        size: size,
      )
          : Icon(
        Icons.play_circle_fill_rounded,
        color: AppColors.primary,
        size: size,
      ),
    );
  }

}