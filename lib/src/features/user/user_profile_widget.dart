import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // User is not logged in
      return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Center(
          child: Text('No user logged in'),
        ),
      );
    } else {
      // User is logged in
      return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Logged in as:'),
              SizedBox(height: 8),
              Text('Email: ${user.email}'),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  // Perform any additional actions upon signing out
                },
                child: Text('Sign out'),
              ),
            ],
          ),
        ),
      );
    }
  }
}