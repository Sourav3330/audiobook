import 'package:flutter/foundation.dart';

class BookModel {
  final String id;
  final String title;
  final String author;
  final String cover;
  final String category;
  final String description;
  final String language;
  final Duration duration;
  final int totalChapters;
  final double rating;
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
