import 'package:flutter/material.dart';

class UserSignInForm extends StatelessWidget {
  const UserSignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Form(
        child: Column(
          children: [
            ///Email

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outlined),
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
            SizedBox(
              height: 10,
            ),

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
                  suffixIcon: Icon(Icons.remove_red_eye_rounded)),
            ),
            SizedBox(
              height: 8,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember_me

                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text("Remember me")
                  ],
                ),

                ///Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            ///SignIn Button
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust border radius as needed
                    ),
                  ),
                  child: const Text('SignIn'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///SignUp Button
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey.shade50),
                  ),
                  child: const Text('Create a new account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}