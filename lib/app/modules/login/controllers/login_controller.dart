import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/bindings/admin_binding.dart';
import 'package:myapp/app/modules/admin/views/admin_view.dart';
import 'package:myapp/app/modules/home/bindings/home_binding.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var role = ''.obs;

  // Validation logic for inputs
  bool validateForm() {
    if (email.isEmpty || password.isEmpty) {
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
    } else {
      Get.snackbar("Error", "Please fill in both email and password.");
    }
  }
}
