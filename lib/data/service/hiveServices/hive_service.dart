import 'package:audio_book/data/dumydata/dummy.dart';
import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/service/hiveServices/hive_boxes.dart';
import 'package:hive_ce/hive.dart';
import 'package:get/get.dart';

class HiveService {
  final Box<BookModel>downloads = Hive.box<BookModel>(HiveBoxes.downloads);
  Future<void>saveDownloads(BookModel book)async{
    await downloads.put(book.id,book);
    Get.snackbar("Success", "boolSaved");
  }

  List<BookModel>getDownloads(){
    return  downloads.values.toList();
  }
  Future<void>deleteDownloads(String id)async{
    await downloads.delete(id);

  }
}