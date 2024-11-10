import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

   bool validateForm() {
    if (email.isEmpty && password.isEmpty) {
      return false; // Example validation logic
    }  
    return true;
  }
  // Function to handle login logic
  void signIn() {
    // Perform your login logic here (e.g., validate inputs, call API)
    if (email.isNotEmpty && password.isNotEmpty) {
      Get.snackbar("Success", "You are successfully Sign In!");// If credentials are valid, navigate to HomePage    
    } else {
      Get.snackbar("Error", "Please fill in both email and password.");
    }
  }
}
