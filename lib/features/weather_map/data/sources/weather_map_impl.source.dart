import 'dart:typed_data';

import 'package:farm_setu_assignment/core/constant/api_keys.dart';
import 'package:farm_setu_assignment/core/services/network_services/dio_rest_service.dart';
import 'package:farm_setu_assignment/core/services/network_services/http_service.dart';
import 'package:farm_setu_assignment/features/weather_map/data/models/weather_maps.model.dart';
import 'package:farm_setu_assignment/features/weather_map/data/sources/weather_map.source.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherMapDataSourceProvider = Provider<WeatherMapDataSource>((ref) =>
    WeatherMapDataSourceImpl());

class WeatherMapDataSourceImpl implements WeatherMapDataSource {
  WeatherMapDataSourceImpl();

  @override
  Future<WeatherMapModel?> getWeatherMap(
      String mapType, int x, int y, int zoom) async {
    final uri = Uri.parse(
        "https://tile.openweathermap.org/map/$mapType/$zoom/$x/$y.png?appid=${APIKeys.openWeatherAPIKey}");

    final ByteData imageData = await NetworkAssetBundle(uri).load("");
    return WeatherMapModel.fromByteData(imageData);
  }
}
