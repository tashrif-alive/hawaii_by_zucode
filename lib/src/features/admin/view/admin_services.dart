import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/admin/services/categories/bus/view/bus_screen.dart';
import 'package:hawaii_app/src/features/admin/services/categories/e_visa/view/e_visa_screen.dart';
import 'package:hawaii_app/src/features/admin/services/categories/package/view/package_screen.dart';
import '../services/categories/airline/view/flight_screen.dart';
import '../services/categories/hotel/view/hotel_screen.dart';
import '../services/categories/rent_a_car/view/car_screen.dart';

class AdminServicesScreen extends StatefulWidget {
  const AdminServicesScreen({Key? key});

  @override
  State<AdminServicesScreen> createState() => _AdminServicesScreenState();
}

class _AdminServicesScreenState extends State<AdminServicesScreen> {
  final List<Map<String, dynamic>> services = [
    {
      "icon": Icons.flight,
      "color": Colors.purple,
      "title": "Flight",
      "screen": FlightScreen()
    },
    {
      "icon": Icons.hotel,
      "color": Colors.brown,
      "title": "Hotel",
      "screen": const HotelScreen()
    },
    {
      "icon": Icons.directions_bus,
      "color": Colors.cyan,
      "title": "Bus",
      "screen": const BusScreen()
    },
    {
      "icon": Icons.car_rental,
      "color": Colors.deepOrange,
      "title": "Cars",
      "screen": const CabScreen()
    },
    {
      "icon": Icons.my_library_books,
      "color": Colors.blueGrey,
      "title": "Package",
      "screen": const PackageScreen()
    },
    {
      "icon": Icons.menu_book_sharp,
      "color": Colors.green,
      "title": "E-Visa",
      "screen": const VisaScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Services",
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
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
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
                      padding: EdgeInsets.all(6),
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
                          SizedBox(height: 3), // Adjust spacing here
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
              SizedBox(height: 12),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 20),
              Text(
                "Transactions",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
