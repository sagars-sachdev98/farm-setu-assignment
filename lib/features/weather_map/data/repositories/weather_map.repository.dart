import 'package:farm_setu_assignment/features/weather_map/data/models/weather_maps.model.dart';

abstract class WeatherMapRepository {
  Future<WeatherMapModel?> getWeatherMap(String mapType, int x, int y, int zoom);
}