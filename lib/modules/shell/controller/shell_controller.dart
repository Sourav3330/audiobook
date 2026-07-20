import 'package:audio_book/services/audio_service.dart';
import 'package:get/get.dart';

class ShellController extends GetxController{

  RxInt currentIndex = 0.obs;
  final AudioService player = Get.find<AudioService>();

  void changeIndex (int index){
    currentIndex.value =index;
  }
}