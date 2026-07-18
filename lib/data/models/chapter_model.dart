class ChapterModel {
  final String id;
  final String bookId;
  final String title;
  final String audioUrl;
  final Duration duration;
  final int chapterNumber;

  const ChapterModel({
    required this.id,
    required this.bookId,
    required this.title,
    required this.audioUrl,
    required this.duration,
    required this.chapterNumber,
  });

  factory ChapterModel.fromMap(
      String id,
      Map<String, dynamic> map,
      ) {
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