import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/alience_carousel.dart';
import '../../../widgets/tabs/user_tab_bar.dart';
import '../components/destination_banner carousel.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UserAppBar(
          onPressed: () {},
          image: 'assets/icons/logos/hawaii_logo.png',
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0,left: 10),
                    child: Text(
                      'Why Book hawaii?',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  const DestinationBannerCarousel(),
                  const AliancesBannerCarousel()
                ],
              ),
            ),

          ],
        ));
  }
}
