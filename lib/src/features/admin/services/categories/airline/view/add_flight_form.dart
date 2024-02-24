import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../../test/image_view.dart';
import '../controller/add_flight_controller.dart';

class FlightFormView extends StatefulWidget {
  const FlightFormView({super.key});

  @override
  _FlightFormViewState createState() => _FlightFormViewState();
}

class _FlightFormViewState extends State<FlightFormView> {
  final _flightController = FlightController();
  final _formKey = GlobalKey<FormState>();

  String _airlineName = '';
  DateTime _selectedDate = DateTime.now();
  String _fromTime = '';
  String _toTime = '';
  String _duration = '';
  String _fromPlace = '';
  String _toPlace = '';
  String _planeModel = '';
  String _baggage = '';
  String _imgUrl = '';
  String _stoppage = '';
  String _arrivalAirport = '';
  String _arrivalTerminal = '';
  String _departureAirport = '';
  String _departureTerminal = '';
  double _ourPrice = 0;
  double _regularPrice = 0;
  bool _refundable = false;
  bool _insurance = false;
  String _flightClassValue = 'Economy';

  final List<String> _flightClassOptions = ['Economy', 'Business', 'First Class'];

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _flightController.addFlight(
          _airlineName,
          _selectedDate.toString(),
          // Convert DateTime to String for saving
          _fromTime,
          _toTime,
          _duration,
          _fromPlace,
          _toPlace,
          _planeModel,
          _refundable,
          _insurance,
          _baggage,
          _flightClassValue,
          _regularPrice,
          _ourPrice,
          _imgUrl,
          _stoppage,
          _arrivalAirport,
          _arrivalTerminal,
          _departureAirport,
          _departureTerminal);
      Navigator.pop(context);
    }
  }

  // Method to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = DateTime(
            picked.year, picked.month, picked.day);
      });
    }
  }

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
          child: Form(
            key: _formKey,
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
                const SizedBox(height: 12),

                ///AirLineName & Model
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.airplane_ticket_outlined),
                            iconColor: Colors.grey,
                            hintText: "Airline",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 14),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an airline';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _airlineName = newValue!,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.airplanemode_active),
                            iconColor: Colors.grey,
                            hintText: "Plane Model",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter plane model';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _planeModel = newValue!,
                        ),
                      ),
                    ],
                  ),
                ),

                ///Destinations
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            iconColor: Colors.grey,
                            hintText: "From",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter departure place';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _fromPlace = newValue!,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            iconColor: Colors.grey,
                            hintText: "To",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter arrival place';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _toPlace = newValue!,
                        ),
                      ),
                    ],
                  ),
                ),

                ///Airports & terminals
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            iconColor: Colors.grey,
                            hintText: "Arrival Airport",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Arrival Airport';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _arrivalAirport = newValue!,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            iconColor: Colors.grey,
                            hintText: "Arrival Terminal",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter arrival terminal';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _arrivalTerminal = newValue!,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            iconColor: Colors.grey,
                            hintText: "Departure Airport",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter departure airport';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _departureAirport = newValue!,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            iconColor: Colors.grey,
                            hintText: "Departure Terminal",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Departure Terminal';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _departureTerminal = newValue!,
                        ),
                      ),
                    ],
                  ),
                ),

                ///Date & Time
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        // Show date picker on tap
                        child: InputDecorator(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.date_range),
                            labelText: 'Arrival Date',
                            labelStyle:  GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  //DateFormat('yyyy-MM-dd').format(_selectedDate),
                                  DateFormat("E,dMMM").format(
                                      _selectedDate),style:  GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),), // Display selected date
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.access_time),
                            iconColor: Colors.grey,
                            hintText: "Departure Time",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter departure time';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _fromTime = newValue!,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.access_time),
                            iconColor: Colors.grey,
                            hintText: "Arrival Time",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter arrival time';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _toTime = newValue!,
                        ),
                      ),
                    ],
                  ),
                ),

                ///Duration & flight Cost

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.money),
                            iconColor: Colors.grey,
                            hintText: "Regular Price",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter regular price';
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              _regularPrice = double.parse(newValue!),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.money),
                            iconColor: Colors.grey,
                            hintText: "Our Price",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter our price';
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              _ourPrice = double.parse(newValue!),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.timer),
                      iconColor: Colors.grey,
                      hintText: "Duration",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter duration';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _duration = newValue!,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.timer),
                      iconColor: Colors.grey,
                      hintText: "Stoppage",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter duration';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _stoppage = newValue!,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: DropdownButtonFormField<String>(
                    value: _flightClassValue,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.airplane_ticket_outlined),
                      iconColor: Colors.grey,
                      hintText: "Flight Class",
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
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
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.business_center),
                      iconColor: Colors.grey,
                      hintText: "Others",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter baggage details';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _baggage = newValue!,
                  ),
                ),

                // Checkbox for Refundable
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _refundable,
                        onChanged: (value) {
                          setState(() {
                            _refundable = value!;
                          });
                        },
                      ),
                      Text('Refundable',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                ImageView(onUploadSuccess: (String url) {
                  _imgUrl = url;
                }),
                // Checkbox for Insurance
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _insurance,
                        onChanged: (value) {
                          setState(() {
                            _insurance = value!;
                          });
                        },
                      ),
                      Text('Insurance',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                // Add Flight Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _submitForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add Flight',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
