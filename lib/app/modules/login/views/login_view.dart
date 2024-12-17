import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/login/controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 800,
                decoration: const BoxDecoration(
                  color: Color(0xFF21005D),
                ),
                child: Stack(
                  children: [
                    // Title
                    const Positioned(
                      left: 0,
                      right: 0,
                      top: 99,
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

                    // Background for form
                    Positioned(
                      left: 30,
                      top: 270,
                      child: Container(
                        width: 350,
                        height: 430,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3F2E7B),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),

                    // Subtitle
                    const Positioned(
                      left: 50,
                      top: 320,
                      child: SizedBox(
                        width: 312,
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

                    // Email Field
                    Positioned(
                      left: 63,
                      top: 400,
                      child: InputField(
                        hintText: 'Enter Email',
                        onChanged: (value) => controller.email.value = value,
                      ),
                    ),

                    // Password Field
                    Positioned(
                      left: 63,
                      top: 511,
                      child: InputField(
                        hintText: 'Enter Your Password',
                        onChanged: (value) => controller.password.value = value,
                        obscureText: true,
                      ),
                    ),

                    // Sign In Button
                    Positioned(
                      left: 132,
                      top: 600,
                      child: GestureDetector(
                        onTap: controller.signIn, // Memanggil fungsi `signIn`
                        child: Container(
                          width: 166,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4D77AC),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
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
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;

  const InputField({
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
