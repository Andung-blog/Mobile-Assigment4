// Binding
import 'package:get/get.dart';
import 'package:myapp/app/modules/admin/controllers/admin_controller.dart';

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(() => AdminDashboardController());
  }
}