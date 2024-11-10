import 'package:get/get.dart';
import 'package:myapp/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // This line registers the LoginController using lazyPut
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
