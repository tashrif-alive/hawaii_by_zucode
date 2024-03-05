import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/add_hotel_model.dart';
import 'edit_hotel_list.dart';
import 'hotel_details.dart';

class ManageHotelListScreen extends StatefulWidget {
  const ManageHotelListScreen({super.key});

  @override
  State<ManageHotelListScreen> createState() => _ManageHotelListScreenState();
}

class _ManageHotelListScreenState extends State<ManageHotelListScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        title: Text('Manage List',style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search hotels',
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black87),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('hotels').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<DocumentSnapshot> filteredHotels =
                    snapshot.data!.docs.where((document) {
                  String hotelName =
                      document['hotelName'].toString().toLowerCase();
                  String location =
                      document['location'].toString().toLowerCase();
                  String searchText = _searchController.text.toLowerCase();
                  return hotelName.contains(searchText) ||
                      location.contains(searchText);
                }).toList();

                return ListView.builder(
                  itemCount: filteredHotels.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = filteredHotels[index];
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8)),
                                      child: Image.network(
                                        data['imgUrl'] ?? '',
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width * .4,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Align(alignment: AlignmentDirectional.topStart,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              data['hotelName'],
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            const Icon(Icons.circle, size: 5),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${data['hotelType']}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.amber.shade200,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.location_on_rounded,
                                              color: Colors.black87,
                                              size: 15,
                                            ),
                                            Text(
                                              '${data['location']}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '\$${data['regularHotelCost']}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text(
                                                '\$${data['offeredHotelCost']}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.green,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 18),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditHotelForm(
                                                    hotel: Hotel(
                                                      id: document.id,
                                                      hotelName:
                                                          data['hotelName'],
                                                      hotelType:
                                                          data['hotelType'],
                                                      location:
                                                          data['location'],
                                                      imgUrl: data['imgUrl'],
                                                      regularHotelCost: data[
                                                          'regularHotelCost'],
                                                      offeredHotelCost: data[
                                                          'offeredHotelCost'],
                                                      numberOfRooms:
                                                          data['numberOfRooms'],
                                                      occupancyRate:
                                                          data['occupancyRate'],
                                                      rating: data['rating'],
                                                    ),
                                                  )));
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, size: 18),
                                    onPressed: () {
                                      // Perform delete operation
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Delete Hotel'),
                                            content: const Text(
                                                'Are you sure you want to delete this hotel?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  /// Delete the hotel data from Firestore
                                                  FirebaseFirestore.instance
                                                      .collection('hotels')
                                                      .doc(document.id)
                                                      .delete()
                                                      .then((value) {
                                                    Navigator.pop(context);
                                                  }).catchError((error) {});
                                                },
                                                child: Text('Delete'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
