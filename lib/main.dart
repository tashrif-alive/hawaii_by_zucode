import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hawaii_app/src/features/signin/views/user_login.dart';
import 'package:hawaii_app/src/widgets/menus/user_navigation_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor blackSwatch = const MaterialColor(
      0xFF000000, // The primary value
      <int, Color>{
        50: Colors.black, // You can define shades as needed
        100: Colors.black,
        200: Colors.black,
        300: Colors.black,
        400: Colors.black,
        500: Colors.black, // This is the primary color
        600: Colors.black,
        700: Colors.black,
        800: Colors.black,
        900: Colors.black,
      },
    );

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: blackSwatch,
      ),
      home: const NavigationMenu(),
    );
  }
}


