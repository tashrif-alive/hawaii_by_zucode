import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../features/admin/services/airline/view/add_flight_form.dart';


class Carousel extends StatefulWidget {
  const Carousel({Key? key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<Map<String, dynamic>> Carousel = [
    {
      "image": "assets/icons/logos/flight_add.png",
      "color": Colors.orange,
      "title": "Add Flight",
      "screen": (){}
    },
    {
      "image": "assets/icons/logos/manage_flight.png",
      "color": Colors.lightGreen,
      "title": "Manage Flights",
      "screen": (){}
    },
    {
      "image": "assets/icons/logos/flight_requ.png",
      "color": Colors.cyan,
      "title": "Flight Request",
      "screen": (){}
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

              ///Carousel
              CarouselSlider.builder(
                itemCount: Carousel.length,
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(Carousel[index]['screen']);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                      decoration: BoxDecoration(
                        color: Carousel[index]['color'][50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Carousel[index]['image'],
                            width: 400, // Adjust image width here
                            height: 70,
                            fit: BoxFit.cover,// Adjust image height here
                          ),

                          Text(
                            Carousel[index]['title'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Carousel[index]['color'],
                              fontSize: 11, // Adjust text size here
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
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
