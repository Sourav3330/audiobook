import 'package:audio_book/modules/library/controller/cate_data_controller.dart';
import 'package:get/get.dart';

class CateDataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CateDataController>(()=>CateDataController());
  }
}