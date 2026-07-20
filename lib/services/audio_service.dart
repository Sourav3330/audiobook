import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../data/models/book_model.dart';
import '../data/models/chapter_model.dart';

class AudioService extends GetxService {

  final AudioPlayer player = AudioPlayer();

  final currentBook = Rxn<BookModel>();
  final currentChapter = Rxn<ChapterModel>();
  final playlist = <ChapterModel>[].obs;
  final currentIndex = 0.obs;
  final isPlaying = false.obs;
  final isLoading = false.obs;
  final position = Duration.zero.obs;
  final duration = Duration.zero.obs;
  final currentSpeed = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    player.positionStream.listen((updatePosition) {
      position.value = updatePosition;
    });
    player.durationStream.listen((updateDuration) {
      duration.value = updateDuration ?? Duration.zero;    });

    player.playerStateStream.listen((playing){
      isPlaying.value = playing.playing;
    });
  }

  Future<void> playBook({
    required BookModel book,
    required List<ChapterModel> chapters,
    int startIndex = 0,
  }) async {
    currentBook.value = book;

    playlist.assignAll(chapters);
    await _loadChapter(startIndex);
  }

  Future<void> _loadChapter(int index) async {
    isLoading.value = true;
    if (index < 0 || index >= playlist.length) return;
    currentIndex.value = index;
    currentChapter.value = playlist[index];
    await player.setUrl(currentChapter.value!.audioUrl);
    await player.play();
    isLoading.value=false;
  }
  Future<void> play() async {
    await player.play();
  }

  Future<void> pause() async {
    await player.pause();
  }
  Future<void> next() async {
    if(currentIndex.value<playlist.length-1) {
      await _loadChapter(currentIndex.value+1);
    }
  }
  Future<void> previous() async {
    if(currentIndex.value>0){
      await _loadChapter(currentIndex.value-1);
    }
  }
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }
  Future<void> setSpeed(double newSpeed) async {
    currentSpeed.value =  newSpeed;
    await player.setSpeed(newSpeed);
  }

  Future<void> forWard10Seconds() async {
    final newPosition = position.value + const Duration(seconds: 10);
    if(newPosition<duration.value){
    await player.seek(newPosition);
    }
    else{
      await player.seek(duration.value);
    }
}

  Future<void> backWard10Seconds() async {
    final newPosition = position.value - const Duration(seconds: 10);
    if(newPosition<Duration.zero){
    await player.seek(Duration.zero);
    }
    else{
      await player.seek(newPosition);
    }
  }


}