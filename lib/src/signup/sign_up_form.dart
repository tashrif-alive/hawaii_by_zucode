import 'package:flutter/material.dart';
import 'package:hawaii_app/src/signup/signup_controller.dart';

class SignUpView extends StatelessWidget {
  final SignUpController controller = SignUpController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            Row(
              children: [
                Text('Is Admin?'),
                Switch(
                  value: isAdmin,
                  onChanged: (value) {
                    isAdmin = value;
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.signUp(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  phoneNumber: phoneNumberController.text,
                  isAdmin: isAdmin,
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
