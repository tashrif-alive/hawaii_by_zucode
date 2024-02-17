import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/admin/Airlines/airline_controller.dart';

import '../../../test/image_view.dart';

class FlightFormView extends StatelessWidget {
  final FlightController _flightController = FlightController();
  final TextEditingController _airlineNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fromTimeController = TextEditingController();
  final TextEditingController _toTimeController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _fromPlaceController = TextEditingController();
  final TextEditingController _toPlaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        /// Add_Flights
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: Text(
                  "Add Flight",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              ///AirlineName
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: TextFormField(
                  controller: _airlineNameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.airplane_ticket_outlined),
                    iconColor: Colors.grey,
                    hintText: "Airline",
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

              ///Dates
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_month),
                          iconColor: Colors.grey,
                          hintText: "Arrival Date",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                    const SizedBox(width: 10),
                    // Expanded(
                    //   child: TextFormField(
                    //     controller: _dateController,
                    //     decoration: InputDecoration(
                    //       prefixIcon: const Icon(Icons.calendar_month),
                    //       iconColor: Colors.grey,
                    //       hintText: "Departure Date",
                    //       contentPadding: EdgeInsets.symmetric(vertical: 16),
                    //       // Adjusting the vertical padding
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       fillColor: Colors.grey.shade50,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              ///Time
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _fromTimeController,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.share_arrival_time_outlined),
                          iconColor: Colors.grey,
                          hintText: "Arrival Time",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _toTimeController,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.share_arrival_time_outlined),
                          iconColor: Colors.grey,
                          hintText: "Departure Time",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                  ],
                ),
              ),

              ///Destinations
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _fromPlaceController,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.share_arrival_time_outlined),
                          iconColor: Colors.grey,
                          hintText: "From",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _toPlaceController,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.share_arrival_time_outlined),
                          iconColor: Colors.grey,
                          hintText: "To",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          // Adjusting the vertical padding
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _durationController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.timer_outlined),
                          iconColor: Colors.grey,
                          hintText: "Duration",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageView(),
              ),
              const SizedBox(height: 8),

              ///Add_Flight
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _flightController.addFlight(
                        _airlineNameController.text,
                        _dateController.text,
                        _fromTimeController.text,
                        _toTimeController.text,
                        _durationController.text,
                        _fromPlaceController.text,
                        _toPlaceController.text,
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
                      'Add Flight',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
