import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../commons/dummy.dart';
import 'admin_model.dart';

class AdminLoginController {
  final AdminModel _model = AdminModel();
  final BuildContext _context;

  AdminLoginController(this._context);

  void loginUser(String email, String password) async {
    String? errorMessage = await _model.signInWithEmailAndPassword(email, password);
    if (errorMessage == null) {
      // Login successful, navigate to dummy page
      Navigator.pushReplacement(
        _context,
        MaterialPageRoute(builder: (context) => DummyPage()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
