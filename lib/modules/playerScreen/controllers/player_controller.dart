import 'dart:async';

import 'package:audio_book/data/models/review_model.dart';
import 'package:audio_book/data/repositories/book_repository.dart';
import 'package:audio_book/services/audio_service.dart';
import 'package:get/get.dart';
import '../../../data/models/book_model.dart';
import '../../../data/models/chapter_model.dart';

class PlayerController extends GetxController {
  final AudioService player = Get.find();
  final BookRepository repository = Get.find();
  final BookRepository repo = Get.find();
  final RxDouble currentSpeed = 1.0.obs;

  Rxn<BookModel> get currentBook => player.currentBook;
  Rxn<ChapterModel> get currentChapter => player.currentChapter;
  RxBool get isPlaying => player.isPlaying;
  RxBool get isLoading => player.isLoading;
  Rx<Duration> get position => player.position;
  Rx<Duration> get duration => player.duration;
  Rx<double> get speed => player.currentSpeed;
  RxList<ChapterModel> get playlist => player.playlist;
  //Review section
  RxList<ReviewModel>reviewsList=<ReviewModel>[].obs;
  RxList<ReviewModel>topReviews=<ReviewModel>[].obs;

  RxBool viewChapters = false.obs;

  @override
  void onInit() {
    super.onInit();
loadTopReview();
  }

  void togglePlayPause() {
    if (isPlaying.value == true) {
      player.pause();
    } else {
      player.play();
    }
  }

  Future<void> seek(Duration position) async {
    await player.seek(position);
  }
  Future<void> skipNext() async {
    await player.next();
  }
  Future<void> skipPrevious() async {
    await player.previous();
  }
  Future<void> setSpeed(double newSpeed) async {
    await player.setSpeed(newSpeed);
    currentSpeed.value = newSpeed;

  }
  Future<void> forWard10() async {
    await player.forWard10Seconds();
  }
  Future<void> backWard10() async {
    await player.backWard10Seconds();
  }

  Future<void>loadReviews()async {
 reviewsList.assignAll( repository.getReviews());
  }
  Future<void>loadTopReview()async {
 topReviews.assignAll(repository.getTopReviews().take(10));
  }
  Future <void> playBook (BookModel book)async{
    await player.playBook(book: book, chapters:repo.getChapters(book.id) );
  }
  void toggleChapters(){
    viewChapters.value = !viewChapters.value;
  }
void selectChapter(int chapterNumber){
   player.playBook(book: currentBook.value!, chapters: repo.getChapters(currentBook.value!.id
  ),startIndex: chapterNumber-1);
  }

}
