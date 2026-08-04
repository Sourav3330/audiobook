import 'package:hive_ce/hive_ce.dart';
part 'chapter_model.g.dart';

@HiveType(typeId: 2)
class ChapterModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String bookId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String audioUrl;
  @HiveField(4)
  final Duration duration;
  @HiveField(5)
  final int chapterNumber;

  const ChapterModel({
    required this.id,
    required this.bookId,
    required this.title,
    required this.audioUrl,
    required this.duration,
    required this.chapterNumber,
  });

  factory ChapterModel.fromMap(String id, Map<String, dynamic> map) {
    return ChapterModel(
      id: id,
      bookId: map['bookId'],
      title: map['title'],
      audioUrl: map['audioUrl'],
      duration: Duration(seconds: map['duration']),
      chapterNumber: map['chapterNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'title': title,
      'audioUrl': audioUrl,
      'duration': duration.inSeconds,
      'chapterNumber': chapterNumber,
    };
  }
}
