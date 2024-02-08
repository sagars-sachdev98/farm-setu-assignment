import 'package:freezed_annotation/freezed_annotation.dart';
part 'coord.model.freezed.dart';
part 'coord.model.g.dart';

@freezed
class CoordModel with _$CoordModel {
  factory CoordModel({
    double? lat,
  double? lon,
  }) = _CoordModel;

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
}