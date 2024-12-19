import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<ThemeData> currentTheme = ThemeData.dark().obs;
  RxString popupMessage = ''.obs;

  // Function to trigger a popup message for special events
  void checkSpecialEvent() {
    final date = DateTime.now();
    if (date.month == 12 && date.day == 25) {
      popupMessage.value = 'Merry Christmas!';
    } else if (date.month == 10 && date.day == 31) {
      popupMessage.value = 'Happy Halloween!';
    } else {
      popupMessage.value = '';
    }
  }
}
