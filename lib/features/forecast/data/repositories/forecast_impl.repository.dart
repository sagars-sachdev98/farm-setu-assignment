import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/repositories/forecast.repository.dart';
import 'package:farm_setu_assignment/features/forecast/data/sources/forecast.source.dart';
import 'package:farm_setu_assignment/features/forecast/data/sources/forecast_impl.source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forecastRepositoryProvider = Provider<ForecastRepository>((ref) =>
    ForecastRepositoryImpl(dataSource: ref.read(forecastDataSourceProvider)));

class ForecastRepositoryImpl implements ForecastRepository {
  ForecastRepositoryImpl({required ForecastDataSource dataSource})
      : _dataSource = dataSource;

  final ForecastDataSource _dataSource;

  @override
  Future<ForecastModel?> getForecast(double lat,double long) {
    return _dataSource.getForecast(lat,long);
  }
}
