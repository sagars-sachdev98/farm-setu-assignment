import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String forecastEndpoint = '/forecast';
  static const String weatherEndpoint = '/weather';
  
  static final BaseOptions networkOptions = BaseOptions(
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    contentType: 'application/json',
    connectTimeout: const Duration(milliseconds: 10000),
  );
}
