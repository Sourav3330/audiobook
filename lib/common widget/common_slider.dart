import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommonSlider extends StatelessWidget{
  final bool miniPlayer;
  final double value;
  final double max;
  final ValueChanged<double> onChanged;
  final Color? active;
  final Color? inActive;
  const CommonSlider({
    super.key,
    required this.value,
    required this.miniPlayer,
    required this.max,
     this.active,
     this.inActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(

      data: SliderTheme.of(context).copyWith(
        thumbShape: miniPlayer? SliderComponentShape.noThumb:null,
        overlayShape: SliderComponentShape.noOverlay,
        trackHeight: 4,
      ),
      child: Slider(
        activeColor: active ?? (miniPlayer?AppColors.scaffoldBg:AppColors.primary),
        inactiveColor:inActive??(miniPlayer?Colors.grey: AppColors.sliderInactive),
        value: value,
        max: max > 0 ? max : 1,
        onChanged: onChanged,
      ),
    );
  }
}