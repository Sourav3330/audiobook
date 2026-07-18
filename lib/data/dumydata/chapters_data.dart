import '../models/chapter_model.dart';

final List<ChapterModel> dummyChapters = [
  ChapterModel(
    id: '1',
    bookId: '1',
    chapterNumber: 1,
    title: 'Introduction',
    audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    duration: const Duration(minutes: 8, seconds: 12),
  ),

  ChapterModel(
    id: '2',
    bookId: '1',
    chapterNumber: 2,
    title: 'The Power of Tiny Habits',
    audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    duration: const Duration(minutes: 18, seconds: 45),
  ),

  ChapterModel(
    id: '3',
    bookId: '1',
    chapterNumber: 3,
    title: 'Make Habits Obvious',
    audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
    duration: const Duration(minutes: 22, seconds: 10),
  ),

  ChapterModel(
    id: '4',
    bookId: '1',
    chapterNumber: 4,
    title: 'Make Habits Attractive',
    audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
    duration: const Duration(minutes: 20, seconds: 35),
  ),

  ChapterModel(
    id: '5',
    bookId: '1',
    chapterNumber: 5,
    title: 'The Secret to Lasting Change',
    audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
    duration: const Duration(minutes: 17, seconds: 50),
  ),
];