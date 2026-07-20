import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/theme/fonts.dart';
import '../constants/app_colors.dart';

class ChapterListenButton extends StatelessWidget {
  final VoidCallback onTap;

  const ChapterListenButton({
    super.key,
    required this.onTap,

});
  @override
  Widget build(BuildContext context) {
    return  TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero
      ),
        onPressed: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.chapterListListenButton),
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19,vertical: 15),
            child: Row(
              children: [
                Icon(Icons.play_arrow_outlined,color: Colors.white,),
                SizedBox(width: 3,),
                Text('Listen now',style: TextStyle(color: Colors.white,fontFamily: Fonts.poppins,fontSize: 15),),
              ],
            ),
          ),
        )
    );
  }

}