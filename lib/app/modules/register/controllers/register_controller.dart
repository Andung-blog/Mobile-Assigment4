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

  // Simulate a database using a static Map
  static final registeredUsers = <String, String>{};

  // Validation logic for inputs
  bool validateForm() {
    // Validate email
    if (!email.value.endsWith('@gmail.com')) {
      Get.snackbar("Error", "Email must end with @gmail.com.");
      return false;
    }

    // Validate phone number
    if (!RegExp(r"^(?:\+62|08)\d{10}$").hasMatch(phone.value)) {
      Get.snackbar("Error", "Phone number must start with +62 or 08 and contain 12 digits.");
      return false;
    }

    // Validate password and confirm password
    if (password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Password fields cannot be empty.");
      return false;
    }
    if (password.value != confirmPassword.value) {
      Get.snackbar("Error", "Passwords do not match.");
      return false;
    }

    return true;
  }

  // A function to handle the sign-up action
  void signUp() {
    if (validateForm()) {
      // Save email and password to the registered users map
      registeredUsers[email.value] = password.value;
      Get.snackbar("Success", "Registered as ${role.value.toUpperCase()}!");
      Get.to(() => const LoginView(), binding: LoginBinding()); // Navigate to LoginView
    }
  }

  // Function to set role during registration
  void setRole(String selectedRole) {
    role.value = selectedRole;
  }
}
