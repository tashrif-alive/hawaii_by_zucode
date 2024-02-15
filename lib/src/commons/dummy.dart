import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Dummy Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
