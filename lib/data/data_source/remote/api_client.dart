import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../presentation/utils/utils.dart';
import 'api_constants.dart';
import 'api_exception.dart';

class ApiClient {
  late BaseOptions baseOptions;
  late Dio dio;
  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstants.mainUrl);
    dio = Dio(baseOptions);
  }

  /// GET REQUEST
  Future<Response> getRequest({required String path}) async {
    try {
      var response = await dio.get(path);
      debugPrint(response.statusCode.toString());
      // log(response.data);
      return response;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.response!.statusMessage);
      }
    }
  }

  /// POST REQUEST
  Future<Response> postRequest({required String path, dynamic body}) async {
    var token = Utils.getToken();
    final options = Options(
      headers: { "Authorization": "Bearer $token", });
    try {
      var response = await dio.post(path, data: body, options: options);
      debugPrint("Body: $body");
      debugPrint(response.statusCode.toString());
      return response;
    } on DioException catch (e) {
      if (e.response == null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.response!.statusMessage);
      }
    }
  }
}
