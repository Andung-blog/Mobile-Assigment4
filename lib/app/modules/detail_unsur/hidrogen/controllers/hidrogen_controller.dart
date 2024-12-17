import 'package:get/get.dart';

class HidrogenController extends GetxController {
  var symbol = ''.obs;
  var elementName = ''.obs;
  var atomicNumber = 0.obs;
  var atomicWeight = ''.obs;
  var configuration = ''.obs;
  var group = ''.obs;
  var period = ''.obs;

  void setElementData({
    required String symbol,
    required String elementName,
    required int atomicNumber,
    required String atomicWeight,
    required String configuration,
    required String group,
    required String period,
  }) {
    this.symbol.value = symbol;
    this.elementName.value = elementName;
    this.atomicNumber.value = atomicNumber;
    this.atomicWeight.value = atomicWeight;
    this.configuration.value = configuration;
    this.group.value = group;
    this.period.value = period;
  }
}
