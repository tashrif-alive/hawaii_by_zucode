import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/add_hotel_model.dart';

class HotelController {
  final CollectionReference hotels =
      FirebaseFirestore.instance.collection('hotels');

  Future<void> addHotel(
    String hotelName,
    String hotelType,
    String location,
    String hotelCost,
    // String toPlace,
  ) async {
    try {
      String id = _generateRandomId();
      await hotels.doc(id).set(
            Hotel(
              id: id,
              hotelName: hotelName,
              hotelType: hotelType,
              location: location,
              hotelCost: hotelCost,
            ).toMap(),
          );
    } catch (e) {
      print("Error adding Hotel: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}
