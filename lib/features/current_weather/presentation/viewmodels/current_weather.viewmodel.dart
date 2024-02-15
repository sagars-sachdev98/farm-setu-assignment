import 'package:farm_setu_assignment/features/current_weather/data/models/current_weather.model.dart';
import 'package:farm_setu_assignment/features/current_weather/data/repositories/current_weather.repository.dart';
import 'package:farm_setu_assignment/features/current_weather/data/repositories/current_weather_impl.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentWeatherViewModelProvider =
    Provider((ref) => CurrentWeatherViewModel(ref.read(currentWeatherRepositoryProvider)));

class CurrentWeatherViewModel {
  CurrentWeatherViewModel(this._repository);

  final CurrentWeatherRepository _repository;

  Future<CurrentWeatherModel?> fetchCurrentWeather(double lat, double long) async {
    CurrentWeatherModel? forecast = await _repository.getWeather(lat, long);

    return forecast;
  }
}