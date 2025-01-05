import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<ThemeData> currentTheme = ThemeData.dark().obs;
  RxString popupMessage = ''.obs;
  Rx<IconData> popupIcon = Icons.star.obs; // Icon default
  Rx<Color> popupColor = Colors.blue.obs; // Warna default

  // Function to trigger a popup message for special events
  void checkSpecialEvent() {
    final date = DateTime.now();

    if (date.month == 12 && date.day == 25) {
      popupMessage.value = 'Merry Christmas!';
      popupIcon.value = Icons.ac_unit; // Use a snowflake-like icon
      popupColor.value = Colors.red;
    } else if (date.month == 10 && date.day == 31) {
      popupMessage.value = 'Happy Halloween!';
      popupIcon.value = Icons.emoji_emotions;
      popupColor.value = Colors.orange;
    } else {
      popupMessage.value = 'Have a great day!';
      popupIcon.value = Icons.sunny;
      popupColor.value = Colors.blue;
    }
  }
}
