import 'dart:io';

import 'package:dar_mahaleh/app/models/neshan_address_response_model.dart';
import 'package:dio/dio.dart';

import '../data/api_urls.dart';
import '../data/fetch_data_exception.dart';

class GeoApi {
  static Future<NeshanAddressResponseModel?> convertGeoToAddress(
      String long, String lat) async {
    Map<String, dynamic> data = {'lat': lat, 'lng': long};
    late Response response;
    var dio = Dio();

    response = await dio.get(
      '${ApiUrls.neshanRoot}',
      queryParameters: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            'Api-Key': 'service.0df69a20978641e9b3186168003eddac'
          }),
    );
    if (response.statusCode == 200) {
      return NeshanAddressResponseModel.fromJson(response.data);
    } else if (response.statusCode == 404) {
      throw FetchDataException('');
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
      return response;
    } else if (response.statusCode == 404) {
      throw FetchDataException(
          'شماره همراه شما یافت نشد ، لطفا از گزینه ثبت نام اقدام نمایید ');
    } else {
      throw FetchDataException(response.data);
    }
  }
}
