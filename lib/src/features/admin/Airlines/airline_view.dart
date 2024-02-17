import 'package:flutter/material.dart';
import 'package:hawaii_app/src/features/admin/Airlines/airline_controller.dart';

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
        title: Text('Add Flight'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _airlineNameController,
                decoration: InputDecoration(labelText: 'Airline Name'),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              TextFormField(
                controller: _fromTimeController,
                decoration: InputDecoration(labelText: 'From Time'),
              ),
              TextFormField(
                controller: _toTimeController,
                decoration: InputDecoration(labelText: 'To Time'),
              ),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(labelText: 'Duration'),
              ),
              TextFormField(
                controller: _fromPlaceController,
                decoration: InputDecoration(labelText: 'From Place'),
              ),
              TextFormField(
                controller: _toPlaceController,
                decoration: InputDecoration(labelText: 'To Place'),
              ),
              ElevatedButton(
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
                child: Text('Add Flight'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
