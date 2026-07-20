import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommonSlider extends StatelessWidget{
  final bool miniPlayer;
  final double value;
  final double max;
  final ValueChanged<double> onChanged;

  const CommonSlider({
    super.key,
    required this.value,
    required this.miniPlayer,
    required this.max,
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
        activeColor: miniPlayer?AppColors.scaffoldBg:AppColors.primary,
        inactiveColor:miniPlayer?Colors.grey: AppColors.sliderInactive,
        value: value,
        max: max > 0 ? max : 1,
        onChanged: onChanged,
      ),
    );
  }
}