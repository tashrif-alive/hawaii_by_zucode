import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controls/upload_aliances/banner_list.dart';
import '../controls/upload_aliances/upload_aliances_screen.dart';
import '../services/airline/view/flight_list_screen.dart';
import '../widgets/search_bar_widget.dart';


class AliancesBannerScreen extends StatefulWidget {
  const AliancesBannerScreen({Key? key});

  @override
  State<AliancesBannerScreen> createState() => _AliancesBannerScreenState();
}

class _AliancesBannerScreenState extends State<AliancesBannerScreen> {
  final List<Map<String, dynamic>> AliancesBannerScreen = [
    {
      "image": "assets/icons/logos/flight_add.png",
      "color": Colors.orange,
      "title": "Add Banners",
      "screen": const AliancesBannerFormView()
    },
    {
      "image": "assets/icons/logos/flight_requ.png",
      "color": Colors.cyan,
      "title": "Manage Banners",
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
          "Airline ",
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
                "Upload Banner",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),

              ///AliancesBannerScreen
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: AliancesBannerScreen.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(AliancesBannerScreen[index]['screen']);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                      decoration: BoxDecoration(
                        color: AliancesBannerScreen[index]['color'][50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AliancesBannerScreen[index]['image'],
                            width: 70, // Adjust image width here
                            height: 70,
                            fit: BoxFit.cover,// Adjust image height here
                          ),

                          Text(
                            AliancesBannerScreen[index]['title'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: AliancesBannerScreen[index]['color'],
                              fontSize: 11, // Adjust text size here
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              const Divider(thickness: 1),
              Text(
                  "All Banners",
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              const AliancesBannerList()
            ],
          ),
        ),
      ),
    );
  }
}
