import 'package:flutter/material.dart';
import 'package:hawaii_app/src/features/admin/services/categories/hotel/controller/add_hotels_controller.dart';

class AddHotelForm extends StatelessWidget {
  final HotelController _hotelController = HotelController();
  final TextEditingController _hotelNameController = TextEditingController();

  AddHotelForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Form(
              child: Column(
            children: [
              TextFormField(
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
            ],
          ))
        ],
      ),
    );
  }
}
