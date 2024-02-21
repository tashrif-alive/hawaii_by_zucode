import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/admin/services/categories/hotel/controller/add_hotels_controller.dart';

class AddHotelForm extends StatelessWidget {
  final HotelController _hotelController = HotelController();
  final TextEditingController _hotelNameController = TextEditingController();
  final TextEditingController _hotelTypeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _hotelCostController = TextEditingController();

  AddHotelForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            )),
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Flight Service',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Text(
                "Add Hotels",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 15),
            Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    controller: _hotelNameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.hotel),
                      iconColor: Colors.grey,
                      hintText: "Hotel",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjusting the vertical padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    controller: _hotelTypeController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.reviews),
                      iconColor: Colors.grey,
                      hintText: "Type",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjusting the vertical padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_on),
                      iconColor: Colors.grey,
                      hintText: "Location",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjusting the vertical padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    controller: _hotelCostController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.money),
                      iconColor: Colors.grey,
                      hintText: "Cost",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjusting the vertical padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                  ),
                ),
                ///Add_Flight
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _hotelController.addHotel(
                          _hotelNameController.text,
                          _hotelTypeController.text,
                          _hotelCostController.text,
                          _locationController.text,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Add Hotel',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
