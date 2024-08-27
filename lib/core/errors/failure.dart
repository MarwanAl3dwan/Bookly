import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            '[${e.response!.statusCode!}] Connection timeout with server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            '[${e.response!.statusCode!}] Send timeout with server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            '[${e.response!.statusCode!}] Receive timeout with server.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            '[${e.response!.statusCode!}] Incorrect certificate with server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response);
      case DioExceptionType.cancel:
        return ServerFailure(
            '[${e.response!.statusCode!}] Request to server was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            '[${e.response!.statusCode!}] There is no internet connection.');
      case DioExceptionType.unknown:
        {
          return ServerFailure(
              '[${e.response!.statusCode!}] Something went wrong. Please try again later!');
        }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 404:
        return ServerFailure(
            '[$statusCode] request wasn\'t found. Please try again.');
      case 500:
        return ServerFailure(
            '[$statusCode] There is a problem with the server. Please try again.');
      case 429:
        return ServerFailure(
            '[$statusCode] Too many requests. Try again later.');
      case 400:
      case 401:
      case 403:
        return ServerFailure('[$statusCode] ${response['error']['message']}');
      default:
        {
          return ServerFailure(
              '[$statusCode] Something went wrong. Please try again later!');
        }
    }
  }
}
