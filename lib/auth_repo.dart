import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawaii_app/src/signup/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(AppUser user) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      String uid = userCredential.user!.uid;
      if (user.isAdmin) {
        await _firestore.collection('admin').doc(uid).set({
          'name': user.name,
          'email': user.email,
          'phoneNumber': user.phoneNumber,
        });
      } else {
        await _firestore.collection('users').doc(uid).set({
          'name': user.name,
          'email': user.email,
          'phoneNumber': user.phoneNumber,
        });
      }
    } catch (e) {
      throw e;
    }
  }
}
