import 'package:audio_book/modules/activity/controller/activity_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityView extends GetView<ActivityController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('activity'),),
    );
  }
}
