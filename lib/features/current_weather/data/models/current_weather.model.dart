import 'package:farm_setu_assignment/features/forecast/data/models/coord.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/main.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/weather.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/wind.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'current_weather.model.freezed.dart';
part 'current_weather.model.g.dart';

@freezed
class CurrentWeatherModel with _$CurrentWeatherModel {
  factory CurrentWeatherModel({
    int? id,
    String? name,
    int? timezone,
    int? cod,
    int? dt,
    MainModel? main,
    List<WeatherModel>? weather,
    Clouds? clouds,
    WindModel? wind,
    int? visibility,
    int? pop,
    Sys? sys,
    CoordModel? coord,
  }) = _CurrentWeatherModel;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);
}
