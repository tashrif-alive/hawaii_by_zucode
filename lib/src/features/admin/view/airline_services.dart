import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/admin/services/categories/hotel/view/add_hotel_screen.dart';
import '../services/categories/airline/view/add_flight_form.dart';
import '../services/categories/bus/view/add_buses_screen.dart';


class AirLineServices extends StatefulWidget {
  const AirLineServices({Key? key});

  @override
  State<AirLineServices> createState() => _AirLineServicesState();
}

class _AirLineServicesState extends State<AirLineServices> {
  final List<Map<String, dynamic>> services = [
    {
      "image": "assets/icons/logos/flight_add.png",
      "color": Colors.orange,
      "title": "Add Flight",
      "screen": FlightFormView()
    },
    {
      "image": "assets/icons/logos/manage_flight.png",
      "color": Colors.lightGreen,
      "title": "Manage Flights",
      "screen": AddHotelForm()
    },
    {
      "image": "assets/icons/logos/flight_requ.png",
      "color": Colors.cyan,
      "title": "Booking Request",
      "screen": AddBusView()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Airline Services",
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Services",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),

              ///AirLineServices
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(services[index]['screen']);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: services[index]['color'][50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            services[index]['image'],
                            width: 70, // Adjust image width here
                            height: 70,
                            fit: BoxFit.cover,// Adjust image height here
                          ),

                          Text(
                            services[index]['title'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: services[index]['color'],
                              fontSize: 11, // Adjust text size here
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 12),
              Divider(
                thickness: 1,
              ),
              Text(
                "Flights Details",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
