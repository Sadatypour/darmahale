import 'package:dar_mahaleh/app/modules/category/models/category_response_model.dart';
import 'package:dar_mahaleh/app/modules/category/services/category_api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController factory = Get.find();
  RxList<CategoryResponseModel> categories = <CategoryResponseModel>[].obs;

  RxList<int> backParentIds = <int>[].obs;
  Future<void> getCategories({int? parent, bool isRecord = true}) async {
    var responseCats = await CategoryApi.getCategoriesByParent(parent);
    if (parent != null && isRecord == true) {
      backParentIds.add(parent);
    }
    if (responseCats != null) {
      categories.clear();
      categories.addAll(responseCats);
    }
  }

  Future<void> backCategoryList() async {
    int countElements = backParentIds.length;
    if (countElements == 1) {
      EasyLoading.show();
      await getCategories(isRecord: false);
      backParentIds.clear();
      EasyLoading.dismiss();
    } else {
      backParentIds.removeLast();
      EasyLoading.show();
      getCategories(parent: backParentIds.last, isRecord: false);
      EasyLoading.dismiss();
    }
  }

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
}
