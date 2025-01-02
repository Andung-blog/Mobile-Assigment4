import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/register/bindings/register_binding.dart';
import 'package:myapp/app/modules/register/views/register_view.dart';
import 'package:myapp/app/modules/admin/bindings/admin_binding.dart';
import 'package:myapp/app/modules/admin/views/admin_view.dart';
import 'package:myapp/app/modules/home/bindings/home_binding.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import 'package:myapp/app/modules/register/controllers/register_controller.dart'; // Import RegisterController

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var role = ''.obs;

  // Validation logic for inputs
  bool validateForm() {
    // Validate email
    if (!email.value.endsWith('@gmail.com')) {
      Get.snackbar(
        "Error",
        "Email must end with @gmail.com.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    // Validate email and password are not empty
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill in both email and password.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    // Validate if user is registered
    if (!RegisterController.registeredUsers.containsKey(email.value)) {
      Get.snackbar(
        "Error",
        "Email is not registered.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    // Validate password match
    if (RegisterController.registeredUsers[email.value] != password.value) {
      Get.snackbar(
        "Error",
        "Incorrect password.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  // Function to handle login logic
  void signIn() {
    if (validateForm()) {
      // Set role dynamically based on email (for example purposes)
      if (email.value == "admin@gmail.com") {
        role.value = "admin";
      } else {
        role.value = "client";
      }

      // Perform navigation based on role
      if (role.value == "admin") {
        Get.snackbar("Success", "Welcome Admin!");
        Get.to(() => const AdminDashboardView(), binding: AdminDashboardBinding()); // Navigate to Admin Dashboard
      } else {
        Get.snackbar("Success", "Welcome Client!");
        Get.to(() => const HomeView(), binding: HomeBinding()); // Navigate to Client Home
      }
    }
  }

  // Function to navigate to Register Page
  void goToRegister() {
    Get.snackbar(
      "Warning",
      "You don't have an account. Redirecting to Register Page.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    Future.delayed(const Duration(seconds: 1), () {
      Get.to(() => const RegisterView(), binding: RegisterBinding());
    });
  }
}
