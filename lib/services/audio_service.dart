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
  final position = Duration.zero.obs;
  final duration = Duration.zero.obs;

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
    if (index < 0 || index >= playlist.length) return;
    currentIndex.value = index;
    currentChapter.value = playlist[index];
    await player.setUrl(currentChapter.value!.audioUrl);
    await player.play();
  }
  Future<void> play() async {
    await player.play();
  }

  Future<void> pause() async {
    await player.pause();
  }
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }


}