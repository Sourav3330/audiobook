import 'package:audio_book/app/routes/app_routes.dart';
import 'package:audio_book/data/models/category_model.dart';
import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:get/get.dart';

class LibraryController extends GetxController{
final List<CategoryModel> categories = <CategoryModel>[].obs;
final BookRepository repository = Get.find<BookRepository>();

@override
  void onInit() {
    super.onInit();
    loadCategories();
  }
  void loadCategories() {
  categories.assignAll(repository.getCategory());

  }
  void navigateToCategoryData(CategoryModel category){
   Get.toNamed(AppRoutes.cateDetail,arguments:category
   );
  }

}