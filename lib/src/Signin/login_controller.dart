import 'package:flutter/material.dart';

import 'login_model.dart';

class AuthController {
  final AuthModel _model = AuthModel();
  final BuildContext context;

  AuthController(this.context);

  void loginUser(String email, String password, Function() navigateToDummyPage) async {
    String? errorMessage = await _model.signInWithEmailAndPassword(email, password);
    if (errorMessage == null) {
      // Login successful, navigate to dummy page
      navigateToDummyPage();
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
