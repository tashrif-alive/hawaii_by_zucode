// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class UpdateProfile extends StatelessWidget {
//   const UpdateProfile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final Controller = Get.put(ProfileController());
//     return Scaffold(
//       backgroundColor: Colors.brown.shade50,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Update Profile'),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: <Color>[Color(0xFFfc8a28), Color(0xFFc55c00)],
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.all(20),
//           child: FutureBuilder(
//             future: Controller.getUserData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasData) {
//                   UserModel userData= snapshot.data as UserModel;
//                   return Column(
//                     children: [
//                       Stack(
//                         children: [
//                           SizedBox(
//                             width: 160,
//                             height: 160,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border:
//                                     Border.all(width: 4, color: Colors.orange),
//                                 borderRadius: BorderRadius.circular(100),
//                                 shape: BoxShape.rectangle,
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(100),
//                                 child: const Image(
//                                   image: NetworkImage(
//                                       "https://source.unsplash.com/random/200x200/?face"),
//                                   height: 100,
//                                   width: 100,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 6,
//                             right: 15,
//                             child: Container(
//                               width: 25,
//                               height: 25,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 color: Colors.orange,
//                               ),
//                               child: const Icon(
//                                 CupertinoIcons.camera_circle_fill,
//                                 size: 23.0,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         child: Form(
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 title: SizedBox(
//                                   child: TextFormField(
//                                     initialValue: userData.fullName,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           borderSide: BorderSide.none),
//                                       fillColor: Colors.black26,
//                                       filled: true,
//                                       prefixIcon: const Icon(
//                                         Icons.person,
//                                         color: Colors.orange,
//                                       ),
//                                       hintText: 'Full name',
//                                       hintStyle: const TextStyle(
//                                         color: Colors.black,
//                                       ),
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               ListTile(
//                                 title: SizedBox(
//                                   child: TextFormField(
//               initialValue: userData.email,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           borderSide: BorderSide.none),
//                                       fillColor: Colors.black26,
//                                       filled: true,
//                                       prefixIcon: const Icon(
//                                         Icons.email,
//                                         color: Colors.orange,
//                                       ),
//                                       hintText: 'Email',
//                                       hintStyle: const TextStyle(
//                                         color: Colors.black,
//                                       ),
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               ListTile(
//                                 title: SizedBox(
//                                   child: TextFormField(
//               initialValue: userData.phone,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           borderSide: BorderSide.none),
//                                       fillColor: Colors.black26,
//                                       filled: true,
//                                       prefixIcon: const Icon(
//                                         Icons.phone,
//                                         color: Colors.orange,
//                                       ),
//                                       hintText: 'Phone no',
//                                       hintStyle: const TextStyle(
//                                         color: Colors.black,
//                                       ),
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               ListTile(
//                                 title: SizedBox(
//                                   child: TextFormField(
//                                 initialValue: userData.password,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           borderSide: BorderSide.none),
//                                       fillColor: Colors.black26,
//                                       filled: true,
//                                       prefixIcon: const Icon(
//                                         Icons.lock,
//                                         color: Colors.orange,
//                                       ),
//                                       hintText: 'Password',
//                                       hintStyle: const TextStyle(
//                                         color: Colors.black,
//                                       ),
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.77,
//                           height: 45.0,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: const LinearGradient(
//                               colors: [Color(0xFFff9133), Color(0xFFe16c06)],
//                             ),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: () => Get.back(),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: const Text('Continue'),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 } else if (snapshot.hasError){
//                   return Center(child: Text(snapshot.error.toString()));
//                 } else{
//                   return const Center(child: Text('Something went wrong'));
//                 }
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
