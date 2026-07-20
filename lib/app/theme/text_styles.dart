import 'package:audio_book/constants/app_colors.dart';
import 'package:flutter/rendering.dart';

import 'fonts.dart';

class TextStyles {
  TextStyles._();
  static const TextStyle listNames = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
    fontSize: 19,
  );
  static const TextStyle poppins = TextStyle(
    color: AppColors.primary,
    fontFamily: Fonts.poppins
  );
}