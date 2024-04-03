import 'package:dio/dio.dart';
import 'package:flutter_coding_challenge/constants/api_path.dart';
import 'package:flutter_coding_challenge/helpers/comon_helpers.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_exceptions.dart';

class RestAPIService {
  final Dio _dio;

  RestAPIService(this._dio);

  getHeaders() async {
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers['X-API-Key'] =
        'sA,{tzUD=]dHvYNBJ4xVZ3c=&zS%.UqVc{But?kc';
    _dio.options.headers['User-Agent'] =
        'com.stagingcupid.api/10.16.6 (Release) Android/31';
  }

  getService({required String url}) async {
    String fetchUrl;
    try {
      await getHeaders();

      fetchUrl = CodingChallengeAPI.baseUrl + url;

      //showLog("HEADERS ====>>>>>>" + _dio.options.headers.toString());
      showLog("URL ====>>>>>> GET : $fetchUrl");
      Response response;

      response = await _dio.get(
        fetchUrl,
      );

      showLog("RESPONSE ====>>>>>>${response.data}");
      return response.data;
    } on DioException catch (dioException) {
      showLog(dioException.message!);
      throw RestAPIException.fromDioException(dioException);
    }
  }
}
