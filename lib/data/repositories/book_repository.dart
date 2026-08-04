import 'package:audio_book/data/dumydata/banner_data.dart';
import 'package:audio_book/data/dumydata/category_data.dart';
import 'package:audio_book/data/dumydata/chapters_data.dart';
import 'package:audio_book/data/dumydata/reviews_data.dart';
import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/models/category_model.dart';
import 'package:audio_book/data/models/chapter_model.dart';
import 'package:audio_book/data/models/review_model.dart';
import 'package:audio_book/data/service/hiveServices/hive_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../dumydata/dummy.dart';
import '../models/review_model.dart';


class BookRepository {
  final HiveService hive = Get.find<HiveService>();

  List<BookModel> getNewReleases(){
    return newReleases;
  }
  List<BookModel> getAllBooks(){
    return allBooks;
  }
  List<CategoryModel> getCategory(){
    return dummyCategories;
  }
  List<BookModel> getRecommended(){
    return recommended;
  }
  List<BookModel> getBanners(){
    return banners;
  }
  List <BookModel> getBooksByCategory( String category){
    return allBooks.where((book)=>book.category==category).toList();
  }
  List<ChapterModel> getChapters(String bookId){
    return dummyChapters.where((chapter)=>chapter.bookId==bookId).toList();
  }
  List<ReviewModel> getReviews(){
    return dummyReviews;
}
List<ReviewModel> getTopReviews(){
    return dummyReviews;
}
//Hive Methode
Future<void> putDownload(BookModel book)async{
await hive.saveDownloads(book);
}
List<BookModel> getDownloads(){
    return hive.getDownloads();
}
Future <void> deleteDownloads(String id)async{
await hive.deleteDownloads(id);
}

}