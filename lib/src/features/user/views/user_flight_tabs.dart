import 'package:flutter/material.dart';

import '../components/destination_poster.dart';
import '../components/flight/flight_search_box.dart';

class UserFlightTab extends StatefulWidget {
  const UserFlightTab({super.key});

  @override
  State<UserFlightTab> createState() => _UserFlightTabState();
}

class _UserFlightTabState extends State<UserFlightTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 12),
          const DestinationPoster(),
          FlightSearchBox(hintText: '', onSearch: (String value) {  },)
        ],
      ),
    );
  }
}
