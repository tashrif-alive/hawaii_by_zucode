import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawaii_app/src/features/login/view/signin_screen.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget{
  const UserAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade50,
      elevation: 0,
      title: Image.asset(
        "assets/icons/logos/hawaii.png",
        height: MediaQuery.of(context).size.height*0.05,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications,color: Colors.black87,),
          onPressed: () {},
        ),

        IconButton(
          icon: const Icon(Icons.person, color: Colors.black87,),
          onPressed: () {
            Get.to(() => const LoginScreen());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}