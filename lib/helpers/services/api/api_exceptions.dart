import 'package:dio/dio.dart';

class RestAPIException implements Exception {
  RestAPIException.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        message = dioError.message;
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String? _handleError(int? statusCode, data) {
    switch (statusCode) {
      case 400:
        return data['message'];
      case 401:
        return data['message'];
      case 403:
        return data['message'];
      case 404:
        return data['message'];
      case 405:
        return data['message'];
      case 409:
        return data['message'];
      case 410:
        return data['message'];
      case 422:
        return data['message'];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
