import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/main.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/weather.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/wind.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_list.model.freezed.dart';
part 'weather_list.model.g.dart';

@freezed
class WeatherListModel with _$WeatherListModel {
  factory WeatherListModel({
    int? dt,
    MainModel? main,
    List<WeatherModel>? weather,
    Clouds? clouds,
    WindModel? wind,
    int? visibility,
    int? pop,
    Sys? sys,
    String? dtTxt,
  }) = _WeatherListModel;

  factory WeatherListModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherListModelFromJson(json);
}
