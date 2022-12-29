import 'dart:io';
import 'package:dio/dio.dart';

import '../../../data/api_urls.dart';
import '../../../data/fetch_data_exception.dart';
import '../models/city_model_response.dart';
import '../models/province_model_response.dart';

class AuthApi {
  static Future getProvinces() async {
    // Map<String, dynamic> data = {
    //   'episodeType': episodeType,
    //   'courseId': courseId
    // };
    late Response response;
    var dio = Dio();
    try {
      response = await dio.get(
        '${ApiUrls.root}/Api/GetProvinces',
        // queryParameters: data,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
      );
    } catch (e) {
      FetchDataException(e.toString());
    }
    if (response.statusCode == 200) {
      Iterable data = response.data;
      List<ProvinceModelResponse> responseData =
          data.map((e) => ProvinceModelResponse.fromJson(e)).toList();
      return responseData;
    } else if (response.statusCode == 404) {
      throw FetchDataException(
          'شماره همراه شما یافت نشد ، لطفا از گزینه ثبت نام اقدام نمایید ');
    } else {
      throw FetchDataException(response.data);
    }
  }

  static Future getCityByProvinceId(int provinceId) async {
    Map<String, dynamic> data = {'provinceId': provinceId};
    late Response response;
    var dio = Dio();
    try {
      response = await dio.get(
        '${ApiUrls.root}/Api/GetCity',
        queryParameters: data,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
      );
    } catch (e) {
      FetchDataException(e.toString());
    }
    if (response.statusCode == 200) {
      Iterable data = response.data;
      List<CityModelResponse> responseData =
          data.map((e) => CityModelResponse.fromJson(e)).toList();
      return responseData;
    } else if (response.statusCode == 404) {
      throw FetchDataException(
          'شماره همراه شما یافت نشد ، لطفا از گزینه ثبت نام اقدام نمایید ');
    } else {
      throw FetchDataException(response.data);
    }
  }
}
