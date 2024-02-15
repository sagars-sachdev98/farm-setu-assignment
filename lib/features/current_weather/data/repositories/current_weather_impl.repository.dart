import 'package:farm_setu_assignment/features/current_weather/data/models/current_weather.model.dart';
import 'package:farm_setu_assignment/features/current_weather/data/repositories/current_weather.repository.dart';
import 'package:farm_setu_assignment/features/current_weather/data/sources/current_weather.source.dart';
import 'package:farm_setu_assignment/features/current_weather/data/sources/current_weather_impl.source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentWeatherRepositoryProvider = Provider<CurrentWeatherRepository>(
    (ref) => CurrentWeatherRepositoryImpl(
        dataSource: ref.read(currentWeatherDataSourceProvider)));

class CurrentWeatherRepositoryImpl implements CurrentWeatherRepository {
  CurrentWeatherRepositoryImpl({required CurrentWeatherDataSource dataSource})
      : _dataSource = dataSource;

  final CurrentWeatherDataSource _dataSource;

  @override
  Future<CurrentWeatherModel?> getWeather(double lat, double long) {
    return _dataSource.getWeather(lat, long);
  }
}
