import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'airline_model.dart';

class FlightController {
  final CollectionReference flights = FirebaseFirestore.instance.collection('flights');

  Future<void> addFlight(
      String airlineName,
      String date,
      String fromTime,
      String toTime,
      String duration,
      String fromPlace,
      String toPlace,
      ) async {
    try {
      String id = _generateRandomId();
      await flights.doc(id).set(
        Flight(
          id: id,
          airlineName: airlineName,
          date: date,
          fromTime: fromTime,
          toTime: toTime,
          duration: duration,
          fromPlace: fromPlace,
          toPlace: toPlace,
        ).toMap(),
      );
    } catch (e) {
      print("Error adding flight: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}
