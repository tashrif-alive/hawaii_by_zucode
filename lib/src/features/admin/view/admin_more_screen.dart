import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/bus/controller/bus_co_info_controller.dart';
import '../services/bus/view/bus_company_info.dart';
import '../services/hotel/view/hotel_info_form.dart';
import '../services/rent_a_car/view/add_car_screen.dart';
import '../services/rent_a_car/view/add_driver_details screens.dart';


class AdminMoreScreen extends StatefulWidget {
  const AdminMoreScreen({Key? key});

  @override
  State<AdminMoreScreen> createState() => _AdminMoreScreenState();
}

class _AdminMoreScreenState extends State<AdminMoreScreen> {
  final List<Map<String, dynamic>> services = [
    {
      "icon": Icons.business,
      "color": Colors.green,
      "title": "Hotels Co.",
      "screen": const HotelInformationForm(),
      "cardColor": Colors.green.shade50,
    },
    {
      "icon": Icons.directions_bus_outlined,
      "color": Colors.cyan,
      "title": "Bus Co.",
      "screen":  const BusCompanyInfo(),
      "cardColor": Colors.cyan.shade50,
    },
    {
      "icon": Icons.local_taxi,
      "color": Colors.amber,
      "title": "Cabs Info.",
      "cardColor": Colors.amber.shade50,
      "screen": AddCarScreen(),
    },
    {
      "icon": Icons.airplanemode_active,
      "color": Colors.purple,
      "cardColor": Colors.purple.shade50,
      "title": "Airlines",
      "screen": (){},
    },
    {
      "icon": Icons.account_box,
      "color": Colors.lightBlue,
      "cardColor": Colors.lightBlue.shade50,
      "title": "Drivers",
      "screen": AddDriverView(),
    },
    {
      "icon": Icons.question_mark,
      "color": Colors.grey,
      "cardColor": Colors.grey.shade50,
      "title": "FAQs",
      "screen": (){},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "More",
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Companions Credential",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // GridView to display services
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: services[index]['cardColor'],
                    child: InkWell(
                      onTap: () {
                        Get.to(services[index]['screen']);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              services[index]['icon'],
                              color: services[index]['color'],
                            ),

                            Text(
                              services[index]['title'],
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize:12
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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
