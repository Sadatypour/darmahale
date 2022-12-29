import 'dart:async';
import 'dart:math';

import 'package:dar_mahaleh/app/modules/auth/models/province_model_response.dart';
import 'package:dar_mahaleh/app/modules/auth/services/auth_api.dart';

class BackendService {
  static late List<ProvinceModelResponse> provinces = [];
  static Future<List<ProvinceModelResponse>> getSuggestions(
      String query) async {
    if (provinces.isEmpty) {
      provinces = await AuthApi.getProvinces();
    }

    List<ProvinceModelResponse> matches = [];
    matches.addAll(provinces);

    // return List.generate(3, (index) {
    //   return {
    //     'name': query + index.toString(),
    //     'price': Random().nextInt(100).toString()
    //   };
    // });
    matches.retainWhere(
        (s) => s.xProvinceName!.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class CitiesService {
  static final List<String> cities = [
    'تهران',
    'مازندران',
    'سیستان و بلوچستان',
    'اصفهان',
    'خراسان رضوی',
    'خراسان جنوبی',
    'یزد',
    'کرمان',
    'هرمزگان',
    'گیلان',
    'البرز',
    'چهارمحال بختیاری',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
