import 'package:cloud_firestore/cloud_firestore.dart';

/// The inspector profile stored at `users/{uid}` in Firestore.
class InspectorUser {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;

  /// Always `'inspector'` for accounts created through this app.
  final String role;

  // Optional registration-form details.
  final String? position;
  final String? landline;
  final String? phone;
  final String? companyName;
  final String? companyId;
  final String? state;
  final String? companyAddress;

  const InspectorUser({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.role = 'inspector',
    this.position,
    this.landline,
    this.phone,
    this.companyName,
    this.companyId,
    this.state,
    this.companyAddress,
  });

  String get fullName => '$firstName $lastName'.trim();

  /// Map written to Firestore. `createdAt` / `updatedAt` are added by the
  /// service via [FieldValue.serverTimestamp].
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'role': role,
        if (position != null) 'position': position,
        if (landline != null) 'landline': landline,
        if (phone != null) 'phone': phone,
        if (companyName != null) 'companyName': companyName,
        if (companyId != null) 'companyId': companyId,
        if (state != null) 'state': state,
        if (companyAddress != null) 'companyAddress': companyAddress,
      };

  factory InspectorUser.fromMap(String uid, Map<String, dynamic> map) {
    return InspectorUser(
      uid: uid,
      firstName: (map['firstName'] ?? '') as String,
      lastName: (map['lastName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      role: (map['role'] ?? 'inspector') as String,
      position: map['position'] as String?,
      landline: map['landline'] as String?,
      phone: map['phone'] as String?,
      companyName: map['companyName'] as String?,
      companyId: map['companyId'] as String?,
      state: map['state'] as String?,
      companyAddress: map['companyAddress'] as String?,
    );
  }
}
