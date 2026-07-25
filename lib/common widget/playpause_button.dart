import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PlayPauseButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? size;
  final bool isPlaying;
  final bool isLoading;
  final bool miniPlayer;
  const PlayPauseButton({
    super.key,
    required this.onTap,
    required this.isPlaying,
    required this.isLoading,
    this.size,
    this.miniPlayer = false,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height:miniPlayer ? size ?? 30: 100,
          width:miniPlayer? size ?? 30: 100,
          child: IconButton(
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            icon: isPlaying
                ? Icon(
                    Icons.pause_circle,
                    size: miniPlayer ? size ?? 30 : 100,
                    color: miniPlayer ? AppColors.surface : AppColors.primary,
                  )
                : Icon(
                    Icons.play_circle,
                    size: miniPlayer ? size ?? 30 : 100,
                    color: miniPlayer ? AppColors.surface : AppColors.primary,
                  ),
            onPressed: onTap,
          ),

        ),
      ],
    );
    // SizedBox(
    //   height:miniPlayer ? size ?? 50: 100 ,
    //   width:miniPlayer ? size ?? 50: 100,
    // child:
    //   isLoading?Center(
    //       child: CircularProgressIndicator(
    //     color: miniPlayer?Colors.white:AppColors.primary,
    //
    //   )):
    //   Center(
    //     child: IconButton(
    //       padding: EdgeInsets.zero,
    //      highlightColor: Colors.transparent,
    //     onPressed:onTap,
    //     icon: isPlaying == true
    //         ? Center(
    //           child: Icon(
    //                     Icons.pause_circle_rounded,
    //                     color:miniPlayer?AppColors.scaffoldBg: AppColors.primary,
    //                     size: size,
    //                   ),
    //         )
    //         : Center(
    //           child: Icon(
    //                     Icons.play_circle_fill_rounded,
    //                     color:miniPlayer? AppColors.surface:AppColors.primary,
    //                     size: size,
    //                   ),
    //         ),
    //         ),
    //   ));
  }
}
