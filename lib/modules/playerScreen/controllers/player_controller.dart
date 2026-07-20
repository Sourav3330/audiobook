import 'package:audio_book/services/audio_service.dart';
import 'package:get/get.dart';
import '../../../data/models/book_model.dart';
import '../../../data/models/chapter_model.dart';

class PlayerController extends GetxController {
  final AudioService player = Get.find();

  Rxn<BookModel> get currentBook => player.currentBook;
  Rxn<ChapterModel> get currentChapter => player.currentChapter;
  RxBool get isPlaying => player.isPlaying;
  Rx<Duration> get position => player.position;
  Rx<Duration> get duration => player.duration;
  Rx<double> get speed => player.currentSpeed;
  RxList<ChapterModel> get playlist => player.playlist;

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
  }
  Future<void> forWard10() async {
    await player.forWard10Seconds();
  }
  Future<void> backWard10() async {
    await player.backWard10Seconds();
  }

}
