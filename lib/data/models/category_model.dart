class CategoryModel {
  final String uid;
  final String name;
  final String imageUrl;
  final String description;

  CategoryModel({
    required this.uid,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  factory CategoryModel.fromMap(String uid, Map<String, dynamic> map) {
    return CategoryModel(
      uid: uid,
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
    );
  }
}