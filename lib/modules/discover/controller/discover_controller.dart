import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/models/category_model.dart';
import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  final BookRepository repository = Get.find();

  final RxList<BookModel> allBooks = <BookModel>[].obs;
  final RxList<BookModel> filtered = <BookModel>[].obs;
  final RxList<BookModel> newReleases = <BookModel>[].obs;
  final RxList<BookModel> recommended = <BookModel>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAllBooks();
    loadNewRelease();
    loadRecommended();
  }

  void loadAllBooks() {
    allBooks.assignAll(repository.getAllBooks());
    filtered.assignAll(allBooks);
  }

  void loadRecommended() {
    recommended.assignAll(repository.getRecommended());
  }

  void loadNewRelease() {
    newReleases.assignAll(repository.getNewReleases());
  }

  void filterBooks(String query) {
    if (query.isEmpty) {
      filtered.assignAll(allBooks);
      return;
    }
    filtered.assignAll(
      allBooks.where((book) {
        return book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase()) ||
            book.category.toLowerCase().contains(query.toLowerCase());
      }).toList(),
    );
  }

  void loadCategories() {
    categories.assignAll(repository.getCategory());
  }
}
