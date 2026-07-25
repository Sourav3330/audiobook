class ReviewModel {
  final String userName;
  final double rating;
  final String review;
  final String date;

  ReviewModel({
    required this.userName,
    required this.rating,
    required this.review,
    required this.date,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map, String uid) {
    return ReviewModel(
      userName: map['userName'],
      rating: map['rating'],
      review: map['review'],
      date: map['date'],
    );
  }
}
