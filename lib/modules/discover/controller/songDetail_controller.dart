import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:audio_book/modules/discover/controller/discover_controller.dart';
import 'package:audio_book/services/audio_service.dart';
import 'package:get/get.dart';

class SongDetailController extends GetxController{
late final BookModel book ;
late final List words ;
final DiscoverController discoverController = Get.find();
final AudioService player = Get.find();
final BookRepository repo = Get.find();
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

  Future<void>playBook(BookModel book)async{
  player.playBook(book: book, chapters: repo.getChapters(book.id) );
}


}