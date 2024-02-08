import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';

abstract class ForecastRepository {
  Future<ForecastModel?> getForecast(double lat, double long);
}
