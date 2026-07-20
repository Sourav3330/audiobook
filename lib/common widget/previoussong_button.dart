import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PreviousSongButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? size;

  const PreviousSongButton({super.key,
    required this.onTap,
    this.size

  });
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.skip_previous_rounded,
        color: AppColors.primary,
        size: size,
      ),
    );
  }

}