class CategoryModel {
  final String uid;
  final String name;
  final String imageUrl;

  CategoryModel({
    required this.uid,
    required this.name,
    required this.imageUrl,
  });

  factory CategoryModel.fromMap(String uid, Map<String, dynamic> map) {
    return CategoryModel(
      uid: uid,
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }
}
