import 'package:dar_mahaleh/app/modules/home/models/filter_input_model.dart';
import 'package:dar_mahaleh/app/modules/home/models/filter_model.dart';
import 'package:dar_mahaleh/app/modules/home/models/filter_spec.dart';
import 'package:dar_mahaleh/app/modules/home/services/home_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/post_paged_response_model.dart';

class HomeController extends GetxService {
  static HomeController factory = Get.find();
  //***تعریف متغیرهای گرفتن داده های به صورت صفحه بندی***
  int pageNumber = 1;
  int itemsInPage = 5;
  RxBool hasMore = true.obs;
  RxList<PostItem> postItems = <PostItem>[].obs;
  List<int> fetchingPageIndexes = [];
  List<int> fetchedPageIndexes = [];
  RxBool filterIsActive = false.obs;
//**تعریف متغیر های فیلتر پست ها */
  RxInt selectedBuyerType = (-1).obs;
  String get selectedBuyerTypeTitle {
    switch (selectedBuyerType.value) {
      case 0:
        return 'فروشنده';
      case 1:
        return 'خریدار';
      case 2:
        return 'تهاترکننده';
      default:
        return 'خریداروفروشنده';
    }
  }

  List<Filter> allActivefiltersByGroup = [];
  Rx<FilterInput> filterInput = FilterInput(
    catId: null,
    title: null,
    lat: null,
    lon: null,
    isUrgent: null,
    isImage: null,
    advBuyerType: null,
    citiesId: [],
    parishesId: [],
    specs: [],
  ).obs;
  var inputSpecs = <FilterSpecification>[].obs;
  bool get filterActive {
    if (inputSpecs.isNotEmpty ||
        filterInput.value.advBuyerType != null ||
        filterInput.value.catId != null ||
        filterInput.value.title != null ||
        filterInput.value.lat != null ||
        filterInput.value.lon != null ||
        filterInput.value.isImage != null ||
        filterInput.value.specs.isNotEmpty) {
      return true;
    }
    return false;
  }

  resetVariables() {
    // AdvController.to.loadAdvComplete=false;
    // AdvController.to.fetchMoreCursors.clear();
    filterIsActive.value = false;
    selectedBuyerType.value = -1;
    filterInput.value = FilterInput(
      catId: null,
      title: null,
      lat: null,
      lon: null,
      advBuyerType: null,
      isUrgent: null,
      isImage: null,
      citiesId: [],
      parishesId: [],
      // citiesId:
      //     DbProvider().getFavouriteCities().map((fc) => fc.xCityId).toList(),
      specs: [],
    );
    inputSpecs.value = [];
    //catController.resetVariables();
  }

  removeSpecById(int specId) {
    //var inSpecs = inputSpecs.where((element) => element.specId==specId).toList();
    for (var spec
        in inputSpecs.where((element) => element.specId == specId).toList()) {
      spec.value = null;
      spec.valueFrom = null;
      spec.valueTo = null;
      spec.itemId = null;
    }
    List<FilterSpecification> tempSpecs = [];
    tempSpecs.addAll(inputSpecs);
    inputSpecs.clear();
    inputSpecs.addAll(tempSpecs);
    updateFilterInput();
  }

  updateFilterInput() {
    var inSpecs = inputSpecs.map((isp) {
      return FilterSpec(
          specId: isp.specId,
          itemId: isp.itemId,
          value: isp.value,
          valueFrom: isp.valueFrom,
          valueTo: isp.valueTo);
    }).toList();
    filterInput.value.advBuyerType =
        selectedBuyerType.value == -1 ? null : selectedBuyerType.value;
    filterInput.update((fi) {
      fi?.specs = [];
      fi?.specs.addAll(inSpecs);
    });

    // filterInput.value.specs = inputSpecs.map((isp) {
    //   return FilterSpec(
    //       specId: isp.specId,
    //       itemId: isp.itemId,
    //       value: isp.value,
    //       valueFrom: isp.valueFrom,
    //       valueTo: isp.valueTo);
    // }).toList();
  }

  // void setScalarsSpecsItem(Map<int, List<TextEditingController>> scalarTexts) {
  //   filterInput.value.catId = catController.selectedCatId.value == 0
  //       ? null
  //       : catController.selectedCatId.value;

  //   inputSpecs.removeWhere((s) => scalarTexts.keys.contains(s.specId));
  //   filterInput.value. advBuyerType = selectedBuyerType.value==-1 ? null :  selectedBuyerType.value   ;
  //   for (var key in scalarTexts.keys) {
  //     var valueFrom =
  //         int.tryParse(scalarTexts[key]![0].text.replaceAll(',', ''));
  //     var valueTo = int.tryParse(scalarTexts[key]![1].text.replaceAll(',', ''));
  //     var newInputSpec = FilterSpecification(
  //       specId: key,
  //       valueFrom: valueFrom,
  //       valueTo: valueTo,
  //     );
  //     inputSpecs.add(newInputSpec);
  //   }
  //   updateFilterInput();
  // }

  void setNonScalarSpecItem(int specId, Item? item) {
    var spec = inputSpecs.where((s) => s.specId == specId).toList();
    if (spec.isEmpty) {
      if (item == null) return;
      var newInputSpec = FilterSpecification(
        specId: specId,
        itemId: item.xSpecificationItemIdPk,
        value: item.xItemValue,
        itemTitle: item.xItem,
      );
      inputSpecs.add(newInputSpec);
    } else {
      var inputSpec = spec.first;
      inputSpecs.remove(inputSpec);
      if (item == null) {
        return;
      }
      var newInputSpec = FilterSpecification(
        specId: specId,
        itemId: item.xSpecificationItemIdPk,
        value: item.xItemValue,
        itemTitle: item.xItem,
      );
      inputSpecs.add(newInputSpec);
    }
    updateFilterInput();
  }

  void setNonScalarMultiSelectSpecItem(int specId, List<Item> items) {
    inputSpecs.removeWhere((s) => s.specId == specId);
    if (items.isEmpty) return;
    for (var item in items) {
      var newInputSpec = FilterSpecification(
        specId: specId,
        itemId: item.xSpecificationItemIdPk,
        value: item.xItemValue,
        itemTitle: item.xItem,
      );
      inputSpecs.add(newInputSpec);
    }
    updateFilterInput();
  }

  //گرفتن پست ها بر اساس صفحه جاری
  Future<void> getPagedPosts() async {
    late PostPagedResponseModel value;
    try {
      if (!fetchingPageIndexes.contains(pageNumber)) {
        fetchingPageIndexes.addIf(
            !fetchingPageIndexes.contains(pageNumber), pageNumber);

        value = await HommeApi.getPagedEpisodes(pageNumber, itemsInPage);
        fetchedPageIndexes.add(pageNumber);
        pageNumber = pageNumber + 1;
        hasMore.value = value.hasMore!;
        postItems.addAll(value.items!);
      }
    } catch (e) {
      fetchingPageIndexes.remove(pageNumber);
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
