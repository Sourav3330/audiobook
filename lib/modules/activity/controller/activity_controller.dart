
import 'package:audio_book/data/models/book_model.dart';
import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:audio_book/utils/dialog_utils.dart';
import 'package:audio_book/utils/snackbar_utils.dart';
import 'package:disk_space_plus/disk_space_plus.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController{
  final DiskSpacePlus storage = DiskSpacePlus();
  final BookRepository repo = Get.find<BookRepository>();

  final RxDouble totalStorage = 0.0.obs;
  final RxDouble availableStorage = 0.0.obs;
  final RxDouble usedStorage = 0.0.obs;

  final RxList<BookModel>allDownloads = <BookModel>[].obs;
  final RxBool selectionMode = false.obs;
  final RxList<String> deleteList = <String>[].obs;

@override
  void onInit() {
    super.onInit();
   storageInfo();
  getDownloads();
  }


  Future<void> storageInfo()async{
   final total = await storage.getTotalDiskSpace;
   final free = await storage.getFreeDiskSpace;

   totalStorage.value = total==null ? 0  : total / 1024;
   availableStorage.value = free==null ? 0 : free / 1024;
   usedStorage.value = totalStorage.value-availableStorage.value;
}
 //getDownloadsList

void getDownloads() {
  allDownloads.value = repo.getDownloads();
}

Future<void>deleteDownloads(String id)async{
  final bool confirm = await DialogUtils.confirmDelete(
      title: "Confirm Delete",
      description: "Are You sure",
  );
  if(confirm==false){
    return;
  }
  try{

    await repo.deleteDownloads(id);
    allDownloads.removeWhere((book){return book.id==id;});
    SnackbarUtils.success("Book Deleted Successfully");
  }
  catch(e){
    SnackbarUtils.error("there was a problem when delete the book");
  }
  finally{

  }
}

  void toggleSelection() {
    selectionMode.value = !selectionMode.value;
    if(selectionMode.value==false){
      deleteList.clear();
    }
  }
  void removeOrAddFromSelection(String id){
  if(deleteList.contains(id)){
    deleteList.remove(id);
  }
  else{
    deleteList.add(id);
  }
  }
  Future<void> deleteSelected()async{
    final confirm = await DialogUtils.confirmDelete(title: "Delete", description: "Delete ${deleteList.length} Books");
    if(confirm) {
      try {
        await Future.wait(
            deleteList.map((id) {
              return repo.deleteDownloads(id);
            }));
        deleteList.clear();
        allDownloads.assignAll(repo.getDownloads());
         SnackbarUtils.success("Deleted Successful");
      }
    catch(e){
        SnackbarUtils.error("There was a Problem when delete");
    }
    }
  }
}
//Get.snackbar("${deleteList.length}", "");
