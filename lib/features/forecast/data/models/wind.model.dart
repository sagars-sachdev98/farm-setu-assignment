import 'package:freezed_annotation/freezed_annotation.dart';
part 'wind.model.freezed.dart';
part 'wind.model.g.dart';

@freezed
class WindModel with _$WindModel {
  factory WindModel({
  double? speed,
  int? deg,
  double? gust,
  }) = _WindModel;

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
}
