import 'package:audio_book/data/models/book_model.dart';
import 'package:get/get.dart';

class SongDetailController extends GetxController{
late final BookModel book ;
late final List words ;
@override
  void onInit() {
    super.onInit();
    book  = Get.arguments as BookModel;
    words = book.title.split(' ');
  }

  String getDuration(Duration duration){
  final hours = duration.inHours;
  final minutes = duration.inMinutes;
  return '${hours}h:${minutes.remainder(60)}m';
  }


}