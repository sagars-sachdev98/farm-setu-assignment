import 'package:farm_setu_assignment/features/current_weather/data/models/current_weather.model.dart';

abstract class CurrentWeatherDataSource {
  Future<CurrentWeatherModel?> getWeather(double lat,double long);
}