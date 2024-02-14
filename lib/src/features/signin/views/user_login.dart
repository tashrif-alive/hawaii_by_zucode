import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/user_signin-footer_widgets.dart';
import '../widgets/user_signin_form_widgets.dart';
import '../widgets/user_signin_header_widgets.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 35.0, bottom: 15, left: 15, right: 15),
          child: Column(
            children: [
              const UserSignInHeader(),
              const SizedBox(height: 40),

              ///----------Form-----------///
              const UserSignInForm(),
              const SizedBox(height: 30),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Divider(thickness: 1.4),
                  ),
                  const Text("Or continue with"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Divider(thickness: 1.4),
                  )
                ],
              ),

              ///Footer
              const UserSignInFooter(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        mini: true,
        backgroundColor: Colors.grey.shade50,
        elevation: 0.0,
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
          size: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}






