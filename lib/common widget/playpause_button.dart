import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PlayPauseButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? size;
  final bool isPlaying;
  final bool isLoading;
  const PlayPauseButton({super.key,
    required this.onTap,
    required this.isPlaying,
    required this.isLoading,
    this.size

  });
  @override
  Widget build(BuildContext context) {
    return
    SizedBox(
      height:100 ,
      width: 100,
    child:
      isLoading?Center(child: CircularProgressIndicator()):
      Center(
        child: IconButton(
         highlightColor: Colors.transparent,
        onPressed:onTap,
        icon: isPlaying == true
            ? Center(
              child: Icon(
                        Icons.pause_circle_rounded,
                        color: AppColors.primary,
                        size: size,
                      ),
            )
            : Center(
              child: Icon(
                        Icons.play_circle_fill_rounded,
                        color: AppColors.primary,
                        size: size,
                      ),
            ),
            ),
      ));
  }

}