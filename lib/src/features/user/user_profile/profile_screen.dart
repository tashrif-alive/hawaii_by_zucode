// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     String loggedInUserEmail = "user@example.com";
//
//     return Scaffold(
//       backgroundColor: Colors.brown.shade50,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Material(
//               elevation: 5,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 height: MediaQuery.of(context).size.height * 0.25,
//                 width: double.infinity,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 135.0,bottom: 15),
//                           child: Stack(
//                             children: [
//                               SizedBox(
//                                 width: 100,
//                                 height: 100,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         width: 3, color: Colors.purple.shade900),
//                                     borderRadius: BorderRadius.circular(50),
//                                     shape: BoxShape.rectangle,
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(50),
//                                     child: const Image(
//                                       image: NetworkImage(
//                                           "https://source.unsplash.com/random/200x200/?face"),
//                                       height: 100,
//                                       width: 100,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         CurrentUserWidget(),
//                       ],
//                     ),
//                     FloatingActionButton(
//                       onPressed: () => Get.to(() => const UpdateProfile()),
//                       backgroundColor: Colors.purple.shade900,
//                       mini: true,
//                       child: const Icon(Icons.manage_accounts_rounded),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             // Bottom Part by Tashrif_jubaer
//
//             Container(
//               padding: const EdgeInsets.only(top: 25),
//               child: Column(
//                 children: [
//                   // Container(
//                   //   padding: const EdgeInsets.only(right: 10, bottom: 15, left: 10),
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //     children: [
//                   //       ProfileWidget(
//                   //           title: "Address",
//                   //           icon: Icons.location_on_sharp,
//                   //           onTap: () {}),
//                   //       SizedBox(),
//                   //       ProfileWidget(
//                   //         title: "My Trips",
//                   //         icon: Icons.travel_explore,
//                   //         onTap:  () => Get.to(() => DestinationListPage()),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // Container(
//                   //   padding: EdgeInsets.only(right: 10, bottom: 15, left: 10),
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //     children: [
//                   //       ProfileWidget(
//                   //         title: "Tickets",
//                   //         icon: Icons.airplane_ticket_sharp,
//                   //         onTap: () => Get.to(() => BoughtTicketDetails()),
//                   //       ),
//                   //       SizedBox(),
//                   //       ProfileWidget(
//                   //           title: "Wishlist",
//                   //           icon: Icons.favorite,
//                   //           onTap: () {}),
//                   //     ],
//                   //   ),
//                   // ),
//                   // Container(
//                   //   padding: EdgeInsets.only(right: 10, bottom: 15, left: 10),
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //     children: [
//                   //       ProfileWidget(
//                   //           title: "Memories",
//                   //           icon: Icons.history,
//                   //         onTap: () => Get.to(() => TicketView()),
//                   //       ),
//                   //       SizedBox(),
//                   //       ProfileWidget(
//                   //           title: "Add Card",
//                   //           icon: Icons.credit_card,
//                   //           onTap: () {}),
//                   //     ],
//                   //   ),
//                   // ),
//                   ListTile(
//                     leading: const Icon(Icons.person),
//                     title: const Text("My Profile"),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                     onTap: ()=> Get.to(()=>const UpdateProfile()),
//                     tileColor: Colors.white,
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.shopping_cart),
//                     title: const Text("My Orders"),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                     onTap: ()=> Get.to(()=> BoughtTicketDetails()),
//                     tileColor: Colors.white,
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.add_card),
//                     title: const Text("Add Money"),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                     onTap: ()=> Get.to(()=> DestinationListPage()),
//                     tileColor: Colors.white,
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.help),
//                     title: const Text("Help & Support"),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                       onTap: ()=> Get.to(()=>const ContactUs()),
//                     tileColor: Colors.white,
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//
//
//                   ListTile(
//                     leading: Icon(Icons.settings),
//                     title: Text("Settings"),
//                     trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: ()=> Get.to(()=>const AppSettings()),
//                     tileColor: Colors.white,
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   ListTile(
//                     title: const Align(
//                         alignment: Alignment.center, child: Text("Log out")),
//                     onTap: () {
//                       AuthRepo.instance.logOut();
//                     },
//                     tileColor: Colors.white,
//                   ),
//
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
