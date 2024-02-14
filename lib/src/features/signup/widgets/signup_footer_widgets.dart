import 'package:flutter/material.dart';

class SignUpFooterWidgets extends StatelessWidget {
  const SignUpFooterWidgets({
    Key? key,
  }) : super(key: key); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15,right: 15),
          child: SizedBox(
            height: 45,
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade50),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/logos/google.png"),
                  const Text('Google SignIn'),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Have an account?"),
            TextButton(
              onPressed: () {},
              child: const Text(
                "SignIn",
                style: TextStyle(
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
