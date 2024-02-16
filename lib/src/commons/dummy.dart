import 'package:flutter/material.dart';
import 'package:hawaii_app/src/features/login/view/admin_login_screen.dart';

import '../features/login/controllers/admin_login_controller.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            AdminLoginScreen( // Assuming you have AdminLoginView defined
              onLogin: (String email, String password) {
                AdminLoginController(context).loginUser(email, password); // Use AdminLoginController
              },
            ),
          ],
        ),
      ),
    );
  }
}
