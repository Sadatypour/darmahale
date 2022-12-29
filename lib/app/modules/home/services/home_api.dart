import 'dart:io';

import 'package:dar_mahaleh/app/modules/home/models/post_paged_response_model.dart';
import 'package:dio/dio.dart';

import '../../../data/api_urls.dart';
import '../../../data/fetch_data_exception.dart';

class HommeApi {
  static Future<PostPagedResponseModel> getPagedEpisodes(
      int pageNumber, int itemsInPage) async {
    Map<String, dynamic> data = {
      'pageNumber': pageNumber,
      'itemsInPage': itemsInPage
    };
    late Response response;
    var dio = Dio();
    try {
      response = await dio.get(
        '${ApiUrls.root}/Api/GetPostsPaging',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
        queryParameters: data,
      );
    } catch (e) {
      FetchDataException(e.toString());
    }

    if (response.statusCode == 200) {
      return PostPagedResponseModel.fromJson(response.data);
    } else if (response.statusCode == 404) {
      throw FetchDataException('');
    } else {
      throw FetchDataException(response.data);
    }
  }
}
