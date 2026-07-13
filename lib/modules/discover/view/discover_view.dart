import 'package:audio_book/modules/discover/controller/discover_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverView extends GetView<DiscoverController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text("Discover"),) ,
    );
  }
}