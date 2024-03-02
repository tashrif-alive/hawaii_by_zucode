import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/alience_carousel.dart';
import '../components/destination_poster.dart';
import '../components/flight/flight_search_box.dart';
import '../components/other_services_bar.dart';

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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          ///DestinationPoster
          const DestinationPoster(),

          ///FlightSearchBox
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: FlightSearchBox(
              hintText: 'Search for flights...',
              onSearch: _handleSearch,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0,bottom: 8),
            child: const ExtraServicesBar(),
          ),

          ///Offer_adds
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Why Book hawaii?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const AliancesBannerCarousel(),
        ],
      ),
    );
  }
}
