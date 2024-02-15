import 'package:flutter/cupertino.dart';
import 'package:hawaii_app/src/signup/user_model.dart';

import '../../auth_repo.dart';

class SignUpController {
  final AuthRepository _authRepository = AuthRepository();

  void signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required bool isAdmin,
  }) async {
    try {
      AppUser user = AppUser(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        isAdmin: isAdmin,
      );
      await _authRepository.signUp(user);
      // Handle successful sign-up, maybe navigate to another screen
    } catch (e) {
      // Handle sign-up failure, show error message
      debugPrint('Sign up failed: $e');
    }
  }
}
