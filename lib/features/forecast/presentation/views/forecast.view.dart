import 'package:farm_setu_assignment/core/presentation/views/base_view.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/viewmodels/forecast.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forecastViewFutureProvider =
    FutureProvider.family<ForecastModel?, (double, double)>(
  (ref, coords) async {
    final forecastViewModel = ref.watch(forecastViewModelProvider);
    return forecastViewModel.fetchForecast(coords.$1, coords.$2);
  },
);

class ForecastPage extends StatelessWidget {
  final double? lat;
  final double? long;
  const ForecastPage({Key? key, this.lat, this.long}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final forecast = ref.watch(forecastViewFutureProvider((lat!, long!)));

      return BaseView(
        child: forecast.when(
          data: (data) => Column(
            children: [
              Text(data?.city?.name ?? ""),
              Expanded(
                child: ListView.builder(
                  itemCount: data?.list?.length ?? 0,
                  itemBuilder: (context, index) {
                    final forecastModel = data!.list![index];
                    return Text(
                      forecastModel.main?.temp.toString() ?? "",
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
            ],
          ),
          error: (error, stackTrace) {
            print("$error\n\n${stackTrace.toString()}");
            return SingleChildScrollView(
              child: Center(
                  child: Text(
                "$error\n\n${stackTrace.toString()}",
                style: TextStyle(color: Colors.red),
              )),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      );
    });
  }
}
