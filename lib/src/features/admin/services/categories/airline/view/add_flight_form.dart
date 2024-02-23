import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/add_flight_controller.dart';

class FlightFormView extends StatefulWidget {
  @override
  _FlightFormViewState createState() => _FlightFormViewState();
}

class _FlightFormViewState extends State<FlightFormView> {
  final FlightController _flightController = FlightController();
  final TextEditingController _airlineNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fromTimeController = TextEditingController();
  final TextEditingController _toTimeController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _fromPlaceController = TextEditingController();
  final TextEditingController _toPlaceController = TextEditingController();
  final TextEditingController _planeModelController = TextEditingController();
  final TextEditingController _baggageController = TextEditingController();
  bool _refundable = false;
  bool _insurance = false;
  String _flightClassValue = 'Economy';

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
          ),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Flight Service',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Text(
                  "Add Flight",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: TextFormField(
                  controller: _airlineNameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.airplane_ticket_outlined),
                    iconColor: Colors.grey,
                    hintText: "Airline",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: DropdownButtonFormField<String>(
                        value: _flightClassValue,
                        onChanged: (value) {
                          setState(() {
                            _flightClassValue = value!;
                          });
                        },
                        items: <String>['Economy', 'Business', 'First Class']
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                            .toList(),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.flight_class),
                          hintText: "Flight Class",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: TextFormField(
                        controller: _planeModelController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.airplanemode_active),
                          iconColor: Colors.grey,
                          hintText: "Plane Model",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),

                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
                
              ),
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
                          hintText: "From",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 16),
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
                          hintText: "To",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 16),
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
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month),
                    iconColor: Colors.grey,

                    hintText: "Arrival Date",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                          hintText: "Arrival Time",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 16),
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
                          hintText: "Departure Time",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 16),
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
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: TextFormField(
                  controller: _durationController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.timer_outlined),
                    iconColor: Colors.grey,

                    hintText: "Duration",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: TextFormField(
                  controller: _baggageController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.business_center_sharp),
                    iconColor: Colors.grey,
                    hintText: "Others",hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13),

                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                  ),
                ),
              ),
              // Radio buttons for refundable
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text('Refundable',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 12)),
                          leading: Checkbox(
                            value: _refundable,
                            onChanged: (value) {
                              setState(() {
                                _refundable = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: ListTile(
                          title: Text('Insurance',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 13)),
                          leading: Checkbox(
                            value: _insurance,
                            onChanged: (value) {
                              setState(() {
                                _insurance = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                        _planeModelController.text,
                        _refundable,
                        _insurance,
                        _baggageController.text,
                        _flightClassValue,
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