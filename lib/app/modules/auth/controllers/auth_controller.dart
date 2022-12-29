import 'package:dar_mahaleh/app/modules/auth/models/city_model_response.dart';
import 'package:get/get.dart';

import '../models/province_model_response.dart';
import '../services/auth_api.dart';

class AuthController extends GetxService {
  static AuthController factory = Get.find<AuthController>();
  List<ProvinceModelResponse> provinces = [];
  List<CityModelResponse> cities = [];
  int? selectedProvinceId;
  final count = 0.obs;
  Future<List<ProvinceModelResponse>> getSuggestions(String query) async {
    if (provinces.isEmpty) {
      provinces = await AuthApi.getProvinces();
    }
    List<ProvinceModelResponse> matches = [];
    matches.addAll(provinces);
    matches.retainWhere(
        (s) => s.xProvinceName!.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  Future<List<CityModelResponse>> getCitySuggestions(String query) async {
    cities = await AuthApi.getCityByProvinceId(selectedProvinceId!);
    List<CityModelResponse> matches = [];
    matches.addAll(cities);
    matches.retainWhere(
        (s) => s.xCityName!.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  void onInit() {
    super.onInit();
    // AuthApi.getProvinces().then((value) => provinces.addAll(value));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
