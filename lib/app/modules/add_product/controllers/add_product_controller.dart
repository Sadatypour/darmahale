import 'package:dar_mahaleh/app/modules/add_product/models/product_type.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  static AddProductController factory = Get.find();
  RxList<XFile> images = <XFile>[].obs;

  List<ProductType> productTypes = [
    ProductType(1, 'پست معمولی'),
    ProductType(2, 'گمشده'),
    ProductType(3, 'پیدا  شده'),
    ProductType(4, 'نگرانی هم محله ای'),
    ProductType(5, 'دوره آموزشی'),
  ];
  Rx<int> productTypeSelectedId = 1.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
