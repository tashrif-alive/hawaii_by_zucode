import 'package:flutter/material.dart';
import '../commons/dummy.dart';
import '../signup/sign_up_form.dart';
import 'admin_login_controller.dart';
import 'admin_login_view.dart';
import 'login_controller.dart';
import 'login_view.dart';

class UserTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Login Type')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Builder(
                  builder: (context) => LoginPage(
                    onLogin: (String email, String password) {
                      AuthController(context).loginUser(email, password, () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => DummyPage()),
                        );
                      });
                    },
                    navigateToDummyPage: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DummyPage()),
                      );
                    },
                  ),
                ),
                ),);
              },
              child: Text('User Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Builder(
                    builder: (context) => AdminLoginView( // Assuming you have AdminLoginView defined
                      onLogin: (String email, String password) {
                        AdminLoginController(context).loginUser(email, password); // Use AdminLoginController
                      },
                    ),
                  )),
                );
              },
              child: Text('Admin Login'),
            ),

              SizedBox(height: 20),

            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpView()),
                );
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
