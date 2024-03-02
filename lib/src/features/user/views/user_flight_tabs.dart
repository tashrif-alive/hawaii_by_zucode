import 'package:flutter/material.dart';

import '../components/destination_poster.dart';

class UserFlightTab extends StatefulWidget {
  const UserFlightTab({super.key});

  @override
  State<UserFlightTab> createState() => _UserFlightTabState();
}

class _UserFlightTabState extends State<UserFlightTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 12),
          DestinationPoster()
        ],
      ),
    );
  }
}
