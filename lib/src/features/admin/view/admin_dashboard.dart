import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../login/view/signin_screen.dart';

class AdminDashboard extends StatefulWidget {
  static String routeName = 'AdminDashboard';

  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AdminAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: const AdminTabBar(),
          ),
          const Text(
            'User Statistics',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(const UserDetailsAdmin());
              print("Card tapped!");
            },
            child: Card(
              elevation: 1,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: MediaQuery.of(context).size.width * 0.05,
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Column(
                    children: [
                      Text(
                        "15",
                        style: GoogleFonts.roboto(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Users",
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
///TabBar
class AdminTabBar extends StatelessWidget {
  const AdminTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icons/logos/hawaii.png',
            height: 50,
            width: MediaQuery.of(context).size.width * 0.22,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.message,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
