import 'package:get/get.dart';
import 'package:myapp/app/modules/detail_unsur/hidrogen/controllers/hidrogen_controller.dart';


class HidrogenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HidrogenController>(() => HidrogenController());
  }
}
