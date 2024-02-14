import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_app/src/features/authentications/verify_email.dart';
import 'package:hawaii_app/src/features/signup/views/signup.dart';
import '../../forget_pass/views/forget_pass_screen.dart';
import '../../forget_pass/widgets/forget_pass_btn_widgets.dart';

class AdminSignInForm extends StatelessWidget {
  const AdminSignInForm({
    Key? key,
  }) : super(key: key); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Form(
        child: Column(
          children: [
            ///Email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail_outlined),
                // Using an icon from the iconsax package
                iconColor: Colors.grey,
                hintText: "Email",
                contentPadding: EdgeInsets.symmetric(vertical: 16),
                // Adjusting the vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
            ),
            const SizedBox(height: 10),

            ///Password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                // Using an icon from the iconsax package
                iconColor: Colors.black54,
                hintText: "Password",
                contentPadding: EdgeInsets.symmetric(vertical: 16),
                // Adjusting the vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
                suffixIcon: Icon(Icons.remove_red_eye_rounded),
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember_me
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Remember me"),
                  ],
                ),

                ///Forget Password Button
                TextButton(
                  onPressed: () {
                    ForgetPassScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            ///SignIn Button
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const VerifyEmailScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('SignIn'),
                ),
              ),
            ),
            const SizedBox(height: 10),

            ///SignUp Button
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(const SignUpScreen());
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade50),
                  ),
                  child: Text('Create a new account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

