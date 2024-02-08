import 'package:farm_setu_assignment/features/forecast/data/models/city.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/weather_list.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'forecast.model.freezed.dart';
part 'forecast.model.g.dart';

@freezed
class ForecastModel with _$ForecastModel {
  factory ForecastModel({
    String? cod,
    int? message,
    int? cnt,
    List<WeatherListModel>? list,
    CityModel? city,
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json["pod"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["pod"] = pod;
    return _data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json["all"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["all"] = all;
    return _data;
  }
}
