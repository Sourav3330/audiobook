import 'package:audio_book/app/theme/text_styles.dart';
import 'package:audio_book/modules/playerScreen/controllers/player_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SpeedTile extends GetView<PlayerController>{
  final double value;
  final String? title;

  const SpeedTile({
    super.key,
    required this.value,
    this.title
});
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        ListTile(
          title: Text('${value.toString()} ${title ?? ''} ',style: TextStyles.poppins.copyWith(fontSize: 12),),
          trailing:controller.speed.toDouble() == value?Icon(Icons.check) : null,
          onTap:(){
            controller.setSpeed(value);
            Get.back();
          }
        ),
    );
  }
}