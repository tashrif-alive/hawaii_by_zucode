import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hawaii_app/src/signup/sign_up_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpView(),
    );
  }
}
