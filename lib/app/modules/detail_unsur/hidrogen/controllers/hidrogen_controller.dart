import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/controllers/admin_controller.dart';

class HidrogenController extends GetxController {
  var elementName = 'Hydrogen'.obs;
  var symbol = 'H'.obs;
  var atomicNumber = 1.obs;
  var atomicWeight = '1.008'.obs;
  var configuration = '1s1'.obs;
  var group = '1 (Non-Metal)'.obs;
  var period = 'Period 1'.obs;

  // Method to update element details
  void updateElement(ElementModel element) {
    symbol.value = element.symbol;
    elementName.value = element.name;
    atomicNumber.value = element.atomicNumber;
    // Update more properties here if necessary
  }
}
