import 'dart:io';

import 'package:dar_mahaleh/app/models/neshan_address_response_model.dart';
import 'package:dio/dio.dart';

import '../../../data/api_urls.dart';
import '../../../data/fetch_data_exception.dart';
import '../models/category_response_model.dart';

class CategoryApi {
  static Future getCategoriesByParent(int? parentId) async {
    Map<String, dynamic> data = {'parentId': parentId};
    late Response response;
    var dio = Dio();
    try {
      response = await dio.get(
        '${ApiUrls.root}/Api/GetCategories',
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
      List<CategoryResponseModel> responseData =
          data.map((e) => CategoryResponseModel.fromJson(e)).toList();
      return responseData;
    } else if (response.statusCode == 404) {
      throw FetchDataException('');
    } else {
      throw FetchDataException(response.data);
    }
  }
}
