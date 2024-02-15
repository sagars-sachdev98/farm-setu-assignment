import 'package:farm_setu_assignment/features/weather_map/data/models/weather_maps.model.dart';
import 'package:farm_setu_assignment/features/weather_map/data/repositories/weather_map.repository.dart';
import 'package:farm_setu_assignment/features/weather_map/data/sources/weather_map.source.dart';
import 'package:farm_setu_assignment/features/weather_map/data/sources/weather_map_impl.source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherMapRepositoryProvider = Provider<WeatherMapRepository>((ref) =>
    WeatherMapRepositoryImpl(
        dataSource: ref.read(weatherMapDataSourceProvider)));

class WeatherMapRepositoryImpl implements WeatherMapRepository {
  WeatherMapRepositoryImpl({required WeatherMapDataSource dataSource})
      : _dataSource = dataSource;

  final WeatherMapDataSource _dataSource;

  @override
  Future<WeatherMapModel?> getWeatherMap(
      String mapType, int x, int y, int zoom) {
    return _dataSource.getWeatherMap(mapType, x, y, zoom);
  }
}
