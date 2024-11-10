import 'package:get/get.dart';

class SettingsController extends GetxController {
  // State management using GetX
  final userName = 'Mrs. Selena'.obs;
  final userPhone = '+64826429264'.obs;

  void updateProfile(String name, String phone) {
    userName.value = name;
    userPhone.value = phone;
  }
}
