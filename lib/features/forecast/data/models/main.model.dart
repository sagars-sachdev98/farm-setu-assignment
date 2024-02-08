import 'package:freezed_annotation/freezed_annotation.dart';
part 'main.model.freezed.dart';
part 'main.model.g.dart';

@freezed
class MainModel with _$MainModel {
  factory MainModel({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? seaLevel,
    int? grndLevel,
    int? humidity,
    double? tempKf,
  }) = _MainModel;

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
}
