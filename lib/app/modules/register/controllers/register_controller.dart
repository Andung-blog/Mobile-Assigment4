import 'package:get/get.dart';
import 'package:myapp/app/modules/login/bindings/login_binding.dart';
import 'package:myapp/app/modules/login/views/login_view.dart';

class RegisterController extends GetxController {
  // Declare variables for input fields
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var role = 'client'.obs; // Default role is 'client'

  // Validation logic for inputs
  bool validateForm() {
    if (email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return false; // Example validation logic
    }
    if (password != confirmPassword) {
      return false; // Password mismatch check
    }
    return true;
  }

  // A function to handle the sign-up action
  void signUp() {
    if (validateForm()) {
      Get.snackbar("Success", "Registered as ${role.value.toUpperCase()}!");
      Get.to(() => const LoginView(), binding: LoginBinding()); // Navigate to LoginView
    } else {
      Get.snackbar("Error", "Please check your inputs.");
    }
  }

  // Function to set role during registration
  void setRole(String selectedRole) {
    role.value = selectedRole;
  }
}