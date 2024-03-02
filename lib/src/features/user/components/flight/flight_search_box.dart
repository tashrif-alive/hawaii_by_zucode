import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/user/components/flight/search_flight_screen.dart';
import 'package:intl/intl.dart';

class FlightSearchBox extends StatefulWidget {
  final ValueChanged<Map<String, String>> onSearch;

  const FlightSearchBox(
      {super.key, required this.onSearch, required String hintText});

  @override
  State<FlightSearchBox> createState() => _FlightSearchBoxState();
}

class _FlightSearchBoxState extends State<FlightSearchBox> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _flightClassValue = 'Economy';
  final List<String> _flightClassOptions = [
    'Economy',
    'Business',
    'First Class'
  ];

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    // _dateController.dispose();
    //_classController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade400)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _fromController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.flight_takeoff),
                      hintText: 'Enter Origin',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(0),
                        ),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(0),
                        ),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _toController,
                    decoration: InputDecoration(
                      hintText: 'Enter Destination',
                      prefixIcon: const Icon(Icons.flight_land),
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.date_range),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat("E,dMMM").format(_selectedDate),
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            DropdownButtonFormField<String>(
              value: _flightClassValue,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.airplane_ticket_outlined),
                iconColor: Colors.grey,
                hintText: "Flight Class",
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              items: _flightClassOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _flightClassValue = newValue!;
                });
              },
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final searchData = {
                    'from': _fromController.text,
                    'to': _toController.text,
                    'date': _selectedDate.toString(),
                    'class': _flightClassValue.toString(),

                  };
                  widget.onSearch(searchData);
                  Get.to(FlightSearchResults(searchData: searchData,));
                  print(searchData); // Trigger search
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search, color: Colors.white70),
                    Text(
                      'Search Flights',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
