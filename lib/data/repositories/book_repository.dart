import 'package:audio_book/data/dumydata/category_data.dart';
import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/models/category_model.dart';
import '../dumydata/dummy.dart';


class BookRepository {
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
}