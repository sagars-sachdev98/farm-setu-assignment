import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/repositories/forecast.repository.dart';
import 'package:farm_setu_assignment/features/forecast/data/repositories/forecast_impl.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forecastViewModelProvider =
    Provider((ref) => ForecastViewModel(ref.read(forecastRepositoryProvider)));

class ForecastViewModel {
  ForecastViewModel(this._repository);

  final ForecastRepository _repository;

  Future<ForecastModel?> fetchForecast(double lat, double long) async {
    ForecastModel? forecast = await _repository.getForecast(lat, long);

    return forecast;
  }
}
