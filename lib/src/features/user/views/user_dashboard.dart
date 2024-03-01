import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/admin/services/airline/view/flight_list_screen.dart';
import 'package:hawaii_app/src/features/admin/services/bus/view/bus_list.dart';
import 'package:hawaii_app/src/features/admin/services/hotel/view/hotel_list.dart';
import 'package:hawaii_app/src/features/admin/services/rent_a_car/view/driver_list_sceen.dart';
import 'package:hawaii_app/src/features/user/components/destination_poster.dart';
import '../components/alience_carousel.dart';
import '../../../widgets/tabs/user_tab_bar.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int current = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: current);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "Flight",
      "Hotel",
      "Bus",
      "Cab",
    ];

    List<String> images = [
      "assets/icons/logos/flight.png",
      "assets/icons/logos/hotels.png",
      "assets/icons/logos/buses.png",
      "assets/icons/logos/cabs.png",
    ];
    List<Widget> tabContent = [
      const SingleChildScrollView(child: FlightListScreen()),
      const SingleChildScrollView(child: HotelListScreen()),
      SingleChildScrollView(child: BusListScreen()),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UserAppBar(
        onPressed: () {},
        image: 'assets/icons/logos/hawaii_logo.png',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DestinationPoster(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: List.generate(images.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                            pageController.animateToPage(
                              current,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 21),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Colors.white70
                                  : Colors.white54,
                              borderRadius: current == index
                                  ? BorderRadius.circular(12)
                                  : BorderRadius.circular(12),
                              border: current == index
                                  ? Border.all(
                                  color: Colors.black, width: 2.5)
                                  : null,
                            ),
                            child: Center(
                              child: Image.asset(
                                images[index],
                                width: current == index ? 120 : 125,
                                height: current == index ? 120 : 125,
                                color: current == index
                                    ? Colors.black
                                    : Colors.grey.shade400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Container(
                    height: 350, // Adjust the height as needed
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          current = index;
                        });
                      },
                      children: tabContent,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Why Book hawaii?',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const AliancesBannerCarousel(),
            //ServicesTabs(),
          ],
        ),
      ),
    );
  }
}
