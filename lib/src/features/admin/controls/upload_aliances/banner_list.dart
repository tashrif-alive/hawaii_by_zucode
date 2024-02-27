import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AliancesBannerList extends StatelessWidget {
  const AliancesBannerList({super.key});


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('aliancesBanners').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

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

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      data['imgUrl'] ?? '',
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
