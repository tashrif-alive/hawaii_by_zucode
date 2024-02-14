import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawaii_app/src/features/signin/widgets/admin_signin_footer_widgets.dart';
import 'package:hawaii_app/src/features/signin/widgets/admin_signin_form_widgets.dart';
import 'package:hawaii_app/src/features/signin/widgets/admin_signin_header_widgets.dart';



class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({Key? key}) : super(key: key); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 35.0,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [

              ///----------Header-----------///
              const AdminSignInHeader(),
              const SizedBox(height: 40),

              ///----------Form-----------///
              const AdminSignInForm(),
              const SizedBox(height: 30),

              ///----------Divider-----------///
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

              ///----------Footer-----------///
              const AdminSignInFooter(),
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
