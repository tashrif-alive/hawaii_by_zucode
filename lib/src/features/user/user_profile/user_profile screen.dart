import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/user/user_profile/profile_widget.dart';
import '../../login/view/signin_screen.dart';
import '../../settings/user_settings/app_user_setting_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // User is not logged in
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const Center(
          child: Text('No user logged in'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(const UserSettings());
              },
              icon: const Icon(Icons.settings, color: Colors.black),
            ),
          ],
          backgroundColor: Colors.blueGrey.shade50,
        ),
        backgroundColor: Colors.blueGrey.shade50,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: Colors.grey.shade900),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                        shape: BoxShape.rectangle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/icons/logos/user.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('${user.email}'),
                const SizedBox(height: 12),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ProfileWidget(
                          title: 'Update Account',
                          subtitle: 'Account Details',
                          icon: Icons.manage_accounts_rounded,
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ProfileWidget(
                          title: 'Location',
                          icon: Icons.location_on_sharp,
                          subtitle: 'Uttara',
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ProfileWidget(
                          title: 'My Bookings',
                          icon: Icons.card_travel_rounded,
                          subtitle: 'Uttara',
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ProfileWidget(
                          title: 'My Tickets',
                          icon: Icons.airplane_ticket_outlined,
                          subtitle: 'Uttara',
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ProfileWidget(
                          title: 'Wishlist',
                          icon: Icons.favorite,
                          subtitle: 'Uttara',
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ProfileWidget(
                          title: 'Memories',
                          icon: Icons.access_time,
                          subtitle: 'Uttara',
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ProfileWidget(
                          title: 'Add Card',
                          icon: Icons.add_card,
                          subtitle: 'Uttara',
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const LoginScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('Log out'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
