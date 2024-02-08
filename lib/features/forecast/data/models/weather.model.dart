import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather.model.freezed.dart';
part 'weather.model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
