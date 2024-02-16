// ignore_for_file: constant_identifier_names

enum WeatherMapType {
  precipitation_new,
  temp_new,
}

extension WeatherMapExtension on WeatherMapType {
  String getMapId() {
    return "${name}_id";
  }
}
