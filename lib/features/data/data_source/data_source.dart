import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stockify/core/exceptions/exceptions.dart';

final Dio dio = Dio();

class DataSource {
  static Future<Response<dynamic>> request(String endPoint) async {
    dio.options.baseUrl = "https://www.alphavantage.co/";

    try {
      final response = await dio.get(endPoint);
      return response;
    } on DioException catch (e) {
      log('Error in getting data :$e');
      final errorMessage = DioExceptions.handleDioExceptions(e);
      throw errorMessage;
    } catch (e) {
      log('error while getting data:$e');
      rethrow;
    }
  }
}
