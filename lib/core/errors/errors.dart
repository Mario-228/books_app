import 'package:dio/dio.dart';

abstract class Errors {
  final String errorMessage;

  Errors({required this.errorMessage});
}

class ServerError extends Errors {
  ServerError({required super.errorMessage});

  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errorMessage: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: "Connection sendTimeout");
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: "Connection receiveTimeout");
      case DioExceptionType.badCertificate:
        return ServerError(errorMessage: "Connection badCertificate");
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerError(errorMessage: "Connection canceled");
      case DioExceptionType.connectionError:
        return ServerError(errorMessage: "connection Error");
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return ServerError(errorMessage: "No Internet Conncetion");
        }
        return ServerError(errorMessage: "Unexpected Error, try again...");
      default:
        return ServerError(
            errorMessage: "Opps there was an Error , try again later...");
    }
  }

  factory ServerError.fromResponse(
      int statusCode, Map<String, dynamic> response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(errorMessage: response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerError(
          errorMessage: "Request not found , try again later...");
    } else if (statusCode == 500) {
      return ServerError(errorMessage: "Server Error, try again later...");
    } else {
      return ServerError(
          errorMessage: "Opps there was an Error , try again later...");
    }
  }
}
