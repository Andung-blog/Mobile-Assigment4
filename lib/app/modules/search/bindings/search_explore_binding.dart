import 'package:get/get.dart';
import 'package:myapp/app/modules/search/controllers/search_explore_controller.dart';

class SearchExploreBinding extends Bindings {
  @override
   void dependencies() {
    Get.lazyPut<SearchExploreController>(
      () => SearchExploreController(),
    );
  }
}
