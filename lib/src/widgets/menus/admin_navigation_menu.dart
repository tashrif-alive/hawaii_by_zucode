import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdminBottomBar extends StatefulWidget {
  static String routeName = 'AdminBottomBar';
  const AdminBottomBar({super.key});

  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminBottomBarController());

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
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/dashboard.svg',
                height: 41, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/dashboard_active.svg',
                height: 41, // Replace with the desired height
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/services.svg',
                height: 41, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/services_active.svg',
                height: 42, // Replace with the desired height
              ),
              label: 'Services',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/payment.svg',
                height: 41, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/contact_active.svg',
                height: 41, // Replace with the desired height
              ),
              label: 'Transaction',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/more.svg',
                height: 41, // Replace with the desired width
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/more_active.svg',
                height: 41, // Replace with the desired height
              ),
              label: 'More',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

//..................AdminBottomBarController....................
class AdminBottomBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Container(color: Colors.lightBlue,child: const Center(child: Text("HI Admin"))),
    Container(color: Colors.brown,),
    Container(color: Colors.purple,),
    Container(color: Colors.white10,),
  ];
}
