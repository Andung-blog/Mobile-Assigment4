import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/register/controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 440,
                height: 956,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Color(0xFF21005D)),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      top: 99,
                      right: 50,
                      child: SizedBox(
                        width: 439,
                        height: 99,
                        child: Text(
                          'Welcome ',
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
                      top: 223,
                      child: Container(
                        width: 340,
                        height: 700,
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
                      top: 268,
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
                      left: 50,
                      top: 335,
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
                    // Text field for Phone Number
                    Positioned(
                      left: 50,
                      top: 423,
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
                            controller.phone.value = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Your Phone Number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    // Text field for Password
                    Positioned(
                      left: 50,
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
                    // Text field for Confirm Password
                    Positioned(
                      left: 50,
                      top: 599,
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
                            controller.confirmPassword.value = value;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Re-Enter Your Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    // Dropdown for Role Selection
                    Positioned(
                      left: 50,
                      top: 670,
                      child: Container(
                        width: 300,
                        height: 46,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Obx(() => DropdownButton<String>(
                              value: controller.role.value,
                              onChanged: (String? newRole) {
                                if (newRole != null) {
                                  controller.setRole(newRole);
                                }
                              },
                              items: <String>['client', 'admin']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(value.toUpperCase()),
                                  ),
                                );
                              }).toList(),
                              isExpanded: true,
                              underline: const SizedBox(), // Remove underline
                            )),
                      ),
                    ),
                    // Sign-Up Button
                    Positioned(
                      left: 120,
                      top: 750,
                      child: GestureDetector(
                        onTap: () {
                          controller.signUp();
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
                              'SIGN UP',
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
          ),
        ),
      ),
    );
  }
}
