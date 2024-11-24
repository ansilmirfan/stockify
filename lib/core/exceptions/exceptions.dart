import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

final class DioExceptions {
  static String handleDioExceptions(DioException e) {
    String errorMessage = '';
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage =
            "Connection timeout. Please check your internet connection and try again.";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Request timeout while sending data. Please try again.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage =
            "Response timeout. The server took too long to respond. Please try again later.";
        break;
      case DioExceptionType.badResponse:
        errorMessage = "Received an invalid response from the server.";
        if (e.response != null) {
          log("Response status: ${e.response?.statusCode}, Data: ${e.response?.data}");
          if (e.response?.statusCode == 404) {
            errorMessage = "Requested resource not found.";
          } else if (e.response?.statusCode == 500) {
            errorMessage = "Server error. Please try again later.";
          }
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = "Request was cancelled. Please try again.";
        break;
      case DioExceptionType.unknown:
        errorMessage =
            "An unknown error occurred. Please check your network connection.";
        if (e.error is SocketException) {
          errorMessage =
              "No internet connection. Please check your network and try again.";
        }
        break;
      default:
        errorMessage = "Something went wrong. Please try again.";
    }
    return errorMessage;
  }
}
