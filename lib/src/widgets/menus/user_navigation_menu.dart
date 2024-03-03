import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../features/user/components/flight/flight_fare_list.dart';
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
          height: 70,
          elevation: 1,
          backgroundColor: Colors.grey.shade50,
          surfaceTintColor: Colors.red,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations:  [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 40, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/home_active.svg',
                height: 40, // Replace with the desired height
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/trip.svg',
                height:40, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/trip_active.svg',
                height: 40, // Replace with the desired height
              ),
              label: "My Trip",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/contact.svg',
                height: 40, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/contact_active.svg',
                height: 40, // Replace with the desired height
              ),
              label: "Contact Us",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/more.svg',
                height: 40, // Replace with the desired width
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/more_active.svg',
                height: 40, // Replace with the desired height
              ),
              label: "More",
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
    UserDashboard(),
    FlightFareList(),
    Container(color: Colors.lightBlue,child: const Center(child: Text("Hi User"),),),
    Container(color: Colors.lightBlue,child: const Center(child: Text("Hi User"),),),

  ];
}
