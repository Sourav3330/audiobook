import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive_ce.dart';
part 'book_model.g.dart';

@HiveType(typeId: 1)
class BookModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String cover;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String language;
  @HiveField(7)
  final Duration duration;
  @HiveField(8)
  final int totalChapters;
  @HiveField(9)
  final double rating;
  @HiveField(10)
  final int totalReviews;


  const BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.cover,
    required this.category,
    required this.description,
    required this.duration,
    required this.rating,
    required this.totalChapters,
    required this.totalReviews,
    required this.language,
  });

  factory BookModel.fromMap(String uid, Map<String, dynamic> map) {
    return BookModel(
      id: uid,
      title: map['title'],
      author: map['author'],
      cover: map['cover'],
      category: map['category'],
      description: map['description'],
      duration: map['duration'],
      rating: map['rating'],
      totalChapters: map['chapters'],
      totalReviews: map['totalReviews'],
      language: map['language'],
    );
  }
}
