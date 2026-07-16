import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/models/category_model.dart';
import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:get/get.dart';

class CateDataController extends GetxController {
final BookRepository repository = Get.find();
  final RxList <BookModel> books = <BookModel>[].obs;
  late CategoryModel category ;

  @override
  void onInit() {
    super.onInit();
    category =  Get.arguments as CategoryModel;
    books.assignAll(repository.getBooksByCategory(category.name));
  }
}