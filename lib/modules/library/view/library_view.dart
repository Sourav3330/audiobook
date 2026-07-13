import 'package:audio_book/modules/library/controller/library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryView extends GetView<LibraryController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center( child:  Text("Library"),) ,
    );
  }
}