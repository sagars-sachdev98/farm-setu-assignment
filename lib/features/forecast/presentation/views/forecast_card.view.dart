import 'package:farm_setu_assignment/core/presentation/widgets/error_state_widget.dart';
import 'package:farm_setu_assignment/core/presentation/widgets/shimmer_card.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/viewmodels/forecast.viewmodel.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/widgets/forecast_item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forecastViewFutureProvider =
    FutureProvider.family.autoDispose<ForecastModel?, (double, double)>(
  (ref, coords) async {
    final forecastViewModel = ref.read(forecastViewModelProvider);
    return forecastViewModel.fetchForecast(coords.$1, coords.$2);
  },
);

class ForecastCard extends StatelessWidget {
  final double? lat;
  final double? long;
  const ForecastCard({Key? key, this.lat, this.long}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer(builder: (context, ref, child) {
        final forecast = ref.watch(forecastViewFutureProvider((lat!, long!)));

        return forecast.when(
          data: (data) {
            // API returns data points in 3-hour intervals -> 1 day = 8 intervals
            final items = [0, 8, 16, 24, 32];
            return ForecastItemList(
              weatherDataItems: [
                for (var i in items) data!.list![i],
              ],
            );
          },
          error: (error, stackTrace) =>const ErrorStateWidget(),
          loading: () => const ShimmerCard(height: 380),
        );
      }),
    );
  }
}
