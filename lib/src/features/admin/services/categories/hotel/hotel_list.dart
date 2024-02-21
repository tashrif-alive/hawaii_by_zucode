import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'hotel_details.dart';

class HotelListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return InkWell(
                onTap: () {
                  // Navigate to detailed hotel page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotelDetailScreen(data: data),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(data['hotelName']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location: ${data['location']}'),
                        Text('Type: ${data['hotelType']}'),
                        Text('Cost: ${data['hotelCost']}'),
                        // Add more fields as needed
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
