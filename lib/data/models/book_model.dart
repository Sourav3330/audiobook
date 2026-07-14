import 'package:flutter/foundation.dart';

class BookModel {
  final String id;
  final String title;
  final String author;
  final String cover;
  final String audioUrl;
  final String category;
  final String description;
  final Duration duration;
  final double rating;

  const BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.cover,
    required this.audioUrl,
    required this.category,
    required this.description,
    required this.duration,
    required this.rating,
  });

  factory BookModel.fromMap( String uid,Map<String,dynamic>map){
    return BookModel(
        id:uid,
        title: map['title'],
        author: map['author'],
        cover: map['cover'],
        audioUrl: map['audioUrl'],
        category: map['category'],
        description: map['description'],
        duration: map['duration'],
        rating: map['rating']
    );
  }
}