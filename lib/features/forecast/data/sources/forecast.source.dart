import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';

abstract class ForecastDataSource {
  Future<ForecastModel?> getForecast(double lat,double long);
}
