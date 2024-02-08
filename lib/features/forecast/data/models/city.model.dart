import 'package:farm_setu_assignment/features/forecast/data/models/coord.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'city.model.freezed.dart';
part 'city.model.g.dart';

@freezed
class CityModel with _$CityModel {
  factory CityModel({
    int? id,
    String? name,
    CoordModel? coord,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
