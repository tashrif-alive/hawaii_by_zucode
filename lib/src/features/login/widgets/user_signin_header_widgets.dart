import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLoginHeader extends StatelessWidget {
  const UserLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///----------Header Section-----------///

        Image.asset("assets/icons/logos/hawaii.png"),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Welcome Back!",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700, fontSize: 18),
            )),
        const SizedBox(
          height: 5,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Explore countless destinations and enjoy seamless travel experiences with Hawaii.",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w300, fontSize: 14),
            )),
      ],
    );
  }
}