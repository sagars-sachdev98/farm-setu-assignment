import 'package:farm_setu_assignment/core/constant/api_constants.dart';
import 'package:farm_setu_assignment/core/services/network_services/dio_rest_service.dart';
import 'package:farm_setu_assignment/core/services/network_services/http_service.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/sources/forecast.source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forecastDataSourceProvider = Provider<ForecastDataSource>((ref) =>
    ForecastDataSourceImpl(httpService: ref.read(apiRestServiceProvider)));

class ForecastDataSourceImpl implements ForecastDataSource {
  ForecastDataSourceImpl({required HttpService httpService})
      : _httpService = httpService;

  final HttpService _httpService;
  @override
  Future<ForecastModel?> getForecast(double lat,double long) async {
    final Map<String, dynamic>? apiResponse = await _httpService
        .handleGetRequest(ApiConstants.forecastEndpoint,
            queryParameters: {"lat": lat, "lon": long});

    return apiResponse != null ? ForecastModel.fromJson(apiResponse) : null;
  }
}
