import 'package:flutter/material.dart';

import '../components/destination_poster.dart';
import '../components/flight/flight_search_box.dart';

class UserFlightTab extends StatefulWidget {
  const UserFlightTab({Key? key}) : super(key: key);

  @override
  State<UserFlightTab> createState() => _UserFlightTabState();
}

class _UserFlightTabState extends State<UserFlightTab> {
///Search
  void _handleSearch(Map<String, String> searchData) {
    setState(() {
      from = searchData['from'] ?? '';
      to = searchData['to'] ?? '';
      date = searchData['date'] ?? '';
      flightClass = searchData['class'] ?? '';
    });

    // Perform the search operation using the searchData
    print('From: $from, To: $to, Date: $date, Class: $flightClass');
    // Add your search logic here
  }




  String from = '';
  String to = '';
  String date = '';
  String flightClass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 12),
          const DestinationPoster(),
          FlightSearchBox(
            hintText: 'Search for flights...',
            onSearch: _handleSearch,
          ),
        ],
      ),
    );
  }


}
