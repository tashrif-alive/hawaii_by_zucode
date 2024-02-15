import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final bool? isAdmin;

  AppUser({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.isAdmin,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
    };
  }

  Future<void> registerInFirestore() async {
    try {
      // Convert AppUser object to JSON
      Map<String, dynamic> userData = toJson();

      // Determine the collection to store the user data based on isAdmin value
      String collectionName = isAdmin == true ? 'admin' : 'normal_user';

      // Add user data to Firestore
      await FirebaseFirestore.instance.collection(collectionName).add(userData);
    } catch (e) {
      print('Error registering user in Firestore: $e');
      rethrow;
    }
  }
}
