import 'package:dar_mahaleh/app/modules/add_product/controllers/add_product_controller.dart';
import 'package:get/get.dart';

import '../../category/controllers/category_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AddProductController>(
      () => AddProductController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
  }
}
