import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../features/user/components/flight/flight_fare_list.dart';
import '../../features/user/user_profile/user_profile screen.dart';
import '../../features/user/views/user_dashboard.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 65,
          elevation: 1,
          backgroundColor: Colors.grey.shade50,
          surfaceTintColor: Colors.red,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations:  [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home_active.svg',
                height: 30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 30,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/trip.svg',
                height:30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/trip_active.svg',
                height: 30,
              ),
              label: "My Trip",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/text_regular.svg',
                height: 30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/text.svg',
                height: 30,
              ),
              label: "Contact Us",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/user_regular.svg',
                height: 30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 30,
              ),
              label: "User",
            ),
          ],

        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

//..................Navigation_Controller....................



class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const UserDashboard(),
    const FlightFareList(),
    Container(color: Colors.lightBlue,child: const Center(child: Text("Hi User"),),),
    const UserProfileScreen()

  ];
}
