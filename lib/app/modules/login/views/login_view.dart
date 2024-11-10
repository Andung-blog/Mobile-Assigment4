import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/bindings/home_binding.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import 'package:myapp/app/modules/login/controllers/login_controller.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 800,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Color(0xFF21005D)),
              child: Stack(
                children: [
                  const Positioned(
                    left: 0,
                    right: 10,
                    top: 99,
                    child: SizedBox(
                      width: 439,
                      height: 99,
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 270,
                    child: Container(
                      width: 350,
                      height: 430,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF3F2E7B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 50,
                    top: 320,
                    child: SizedBox(
                      width: 312,
                      height: 59,
                      child: Text(
                        'Please Enter Your Personal Info',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // Text field for Email
                  Positioned(
                    left: 63,
                    top: 400,
                    child: Container(
                      width: 300,
                      height: 46,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.email.value = value;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Email',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ),                      
                  Positioned(
                    left: 63,
                    top: 511,
                    child: Container(
                      width: 300,
                      height: 46,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.password.value = value;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ),
              Positioned(
                left: 132,
                top: 600,
                child: GestureDetector(
                  onTap: () {
                    // Validate the form and navigate to HomeView
                    if (controller.validateForm()) {
                      // Navigate to HomeView
                      Get.to(() => const HomeView(), binding: HomeBinding());
                    } else {
                      Get.snackbar("Error", "Please check your inputs.");
                    }
                  },
                  child: Container(
                    width: 166,
                    height: 44,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF4D77AC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
        )
    )
      )
      );
  }
}