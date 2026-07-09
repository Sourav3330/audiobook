import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserModal {
  UserModal({required this.name, required this.email, required this.uid});
  final String name;
  final String email;
  final String uid;

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uid': uid};
  }

  factory UserModal.fromMap(String uid,Map<String, dynamic> map) {
    return UserModal(
      name: (map["name"] ?? '') as String,
      email: (map['email'] ?? '') as String,
      uid: uid,
    );
  }
}
