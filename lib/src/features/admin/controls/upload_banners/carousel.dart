import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../widgets/dot_indicator.dart';

class Poster extends StatefulWidget {
  const Poster({super.key});

  @override
  State<Poster> createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190,
          width: double.infinity,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('destinationBanner').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final bannerList = snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return data['imgUrl'] ?? '';
              }).toList();

              return PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                itemCount: bannerList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    height: 200,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      image: DecorationImage(
                        image: NetworkImage(bannerList[index]),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: getProportionateScreenWidth(270),
                          margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(5),
                            top: getProportionateScreenHeight(15),
                            bottom: getProportionateScreenHeight(15),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenWidth(15),
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: getProportionateScreenHeight(7)),
                              Text(
                                "Playpillars".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  height: 1.5,
                                  fontSize: getProportionateScreenWidth(24),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(6)),
                              Text(
                                "top up diamond".toUpperCase(),
                                style: TextStyle(
                                  fontSize: getProportionateScreenHeight(10),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HorizontalDotIndicator(
              currentPage: currentPage,
              index: 0,
            ),
            // Add more indicators if needed
          ],
        ),
      ],
    );
  }
}
