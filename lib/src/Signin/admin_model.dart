// admin_model.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user is an admin
      final userSnapshot = await _firestore.collection('admin').doc(userCredential.user!.uid).get();
      if (!userSnapshot.exists) {
        return 'User is not an admin'; // Return error if the user is not an admin
      }

      return null; // No error, successful login
    } catch (e) {
      return e.toString(); // Return error message
    }
  }
}
