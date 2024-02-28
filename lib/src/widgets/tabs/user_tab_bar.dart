import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hawaii_app/src/features/login/view/signin_screen.dart';
import 'package:iconsax/iconsax.dart';

class UserAppBar extends StatefulWidget implements PreferredSizeWidget {
  const UserAppBar({
    super.key,
    // required this.onPressed,
    required this.image, required this.onPressed,
  });

  final VoidCallback onPressed;
  final String image;

  @override
  State<UserAppBar> createState() => _UserAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class _UserAppBarState extends State<UserAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              widget.image,
              // 'assets/icons/logos/hawaii_logo.png',
              height: 50,
              width: MediaQuery.of(context).size.width * 0.20,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.message,
                  color: Colors.black87,
                ),
                onPressed: widget.onPressed,
              ),
              IconButton(
                icon: const Icon(
                  Iconsax.user,
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
