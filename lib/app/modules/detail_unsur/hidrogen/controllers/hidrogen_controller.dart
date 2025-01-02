import 'package:get/get.dart';

class HidrogenController extends GetxController {
  var symbol = ''.obs;
  var elementName = ''.obs;
  var atomicNumber = 0.obs;
  var atomicWeight = ''.obs;
  var configuration = ''.obs;
  var group = ''.obs;
  var period = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if arguments are passed and set data
    if (Get.arguments != null) {
      setElementDataFromArguments(Get.arguments);
    }
  }

  /// Sets the element data dynamically from passed arguments.
  void setElementDataFromArguments(Map<String, dynamic> args) {
    symbol.value = args['symbol'] ?? 'Unknown';
    elementName.value = args['elementName'] ?? 'Unknown';
    atomicNumber.value = args['atomicNumber'] ?? 0;
    atomicWeight.value = args['atomicWeight'] ?? 'Unknown';
    configuration.value = args['configuration'] ?? 'Unknown';
    group.value = args['group'] ?? 'Unknown';
    period.value = args['period'] ?? 'Unknown';
  }

  /// Manually set element data.
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
