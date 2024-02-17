import 'package:flutter/material.dart';

import '../../../../Airlines/airline_view.dart';

class FlightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Service'),
      ),
      body: Center(
        child:Column(
          children: [
            FlightFormView(),
          ],
        )
      ),
    );
  }
}
