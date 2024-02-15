import 'package:farm_setu_assignment/core/constant/api_constants.dart';
import 'package:farm_setu_assignment/core/services/network_services/dio_rest_service.dart';
import 'package:farm_setu_assignment/core/services/network_services/http_service.dart';
import 'package:farm_setu_assignment/features/current_weather/data/models/current_weather.model.dart';
import 'package:farm_setu_assignment/features/current_weather/data/sources/current_weather.source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentWeatherDataSourceProvider = Provider<CurrentWeatherDataSource>((ref) =>
    CurrentWeatherDataSourceImpl(httpService: ref.read(apiRestServiceProvider)));

class CurrentWeatherDataSourceImpl implements CurrentWeatherDataSource {
  CurrentWeatherDataSourceImpl({required HttpService httpService})
      : _httpService = httpService;

  final HttpService _httpService;
  @override
  Future<CurrentWeatherModel?> getWeather(double lat, double long) async {
    final Map<String, dynamic>? apiResponse = await _httpService
        .handleGetRequest(ApiConstants.weatherEndpoint,
            queryParameters: {"lat": lat, "lon": long, "units": "metric"});

    return apiResponse != null ? CurrentWeatherModel.fromJson(apiResponse) : null;
  }
}