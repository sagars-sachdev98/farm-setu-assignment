import 'package:dio/dio.dart';
import 'package:farm_setu_assignment/core/constant/api_keys.dart';
import 'package:farm_setu_assignment/core/services/network_services/dio_request.dart';
import 'package:farm_setu_assignment/core/services/network_services/http_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiRestServiceProvider = Provider<HttpService>((ref) => ApiRestService());

class ApiRestService implements HttpService {
  @override
  Future<List<Map<String, dynamic>>> handleGetRequestList(String endPoint,
      {Map<String, dynamic> queryParameters = const {},
      Function()? onError,
      bool addApiKey = true}) async {
    Response? response;

    Dio? dio = Request.createApiClient(onError: onError);
    if (addApiKey) {
      queryParameters.addAll({
        "appid": APIKeys.openWeatherAPIKey,
      });
    }
    response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    List<Map<String, dynamic>> apiResponse = response.data != null
        ? (response.data as List).map((e) => e as Map<String, dynamic>).toList()
        : [];
    return apiResponse;
  }

  @override
  Future<Map<String, dynamic>?> handleGetRequest(String endPoint,
      {Map<String, dynamic> queryParameters = const {},
      Function()? onError,
      bool addApiKey = true}) async {
    Response? response;

    Dio? dio = Request.createApiClient(onError: onError);
    if (addApiKey) {
      queryParameters.addAll({
        "appid": APIKeys.openWeatherAPIKey,
      });
    }
    response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    Map<String, dynamic>? apiResponse =
        response.data != null ? response.data as Map<String, dynamic> : null;
    return apiResponse;
  }
}
