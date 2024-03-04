import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/user/views/user_trip/user_booked_bus_trip.dart';
import 'package:hawaii_app/src/features/user/views/user_trip/user_booked_cabs_trip.dart';
import 'package:hawaii_app/src/features/user/views/user_trip/user_booked_flight_trip.dart';
import 'package:hawaii_app/src/features/user/views/user_trip/user_booked_hotel_trip.dart';

class UserTripScreen extends StatelessWidget {
   UserTripScreen({Key? key});

  final List<Map<String, dynamic>> services = [
    {
      "icon": Icons.connecting_airports_rounded,
      "color": Colors.purple,
      "title": "Flight",
      "screen": const UserBookedFlightScreen()
    },
    {
      "icon": Icons.business_rounded,
      "color": Colors.brown,
      "title": "Hotel",
      "screen": const UserBookedHotelScreen()
    },
    {
      "icon": Icons.directions_bus,
      "color": Colors.cyan,
      "title": "Bus",
      "screen": const UserBookedBusScreen()
    },
    {
      "icon": Icons.time_to_leave,
      "color": Colors.orange,
      "title": "Cabs",
      "screen":  const UserBookedCabsScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Trip",
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),

              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8/ 2,
                  crossAxisSpacing: 18.0,
                  mainAxisSpacing: 18.0,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(services[index]['screen']);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: services[index]['color'][50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            services[index]['icon'],
                            color: services[index]['color'],
                            size: 30, // Adjust icon size here
                          ),
                          const SizedBox(height: 3), // Adjust spacing here
                          Text(
                            services[index]['title'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: services[index]['color'],
                              fontSize: 12, // Adjust text size here
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
