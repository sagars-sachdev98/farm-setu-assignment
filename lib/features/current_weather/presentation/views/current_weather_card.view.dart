import 'dart:ui';

import 'package:farm_setu_assignment/core/presentation/widgets/error_state_widget.dart';
import 'package:farm_setu_assignment/core/presentation/widgets/shimmer_card.dart';
import 'package:farm_setu_assignment/features/current_weather/data/models/current_weather.model.dart';
import 'package:farm_setu_assignment/features/current_weather/presentation/viewmodels/current_weather.viewmodel.dart';
import 'package:farm_setu_assignment/features/forecast/data/utils/temperature.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/widgets/weather_icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final currentWeatherViewFutureProvider =
    FutureProvider.family.autoDispose<CurrentWeatherModel?, (double, double)>(
  (ref, coords) async {
    final currentWeatherViewModel = ref.read(currentWeatherViewModelProvider);
    return currentWeatherViewModel.fetchCurrentWeather(coords.$1, coords.$2);
  },
);

class CurrentWeatherCard extends StatelessWidget {
  final double? lat;
  final double? long;
  const CurrentWeatherCard({Key? key, this.lat, this.long}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final currentWeather =
          ref.watch(currentWeatherViewFutureProvider((lat!, long!)));

      return currentWeather.when(
        data: (data) {
          // // API returns data points in 3-hour intervals -> 1 day = 8 intervals
          // final items = [0, 8, 16, 24, 32];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        // Giving values to SigmaX and SigmaY
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: WeatherIconImage(
                          iconUrl: data?.weather?.first.icon?.iconUrl4x ?? "",
                          size: 160),
                    ),
                  ),
                  Positioned.fill(
                    top: -40,
                    right: -30,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: WeatherIconImage(
                          iconUrl: data?.weather?.first.icon?.iconUrl4x ?? "",
                          size: 200),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today, ${DateFormat.MMMd().format(
                          DateTime.fromMillisecondsSinceEpoch(
                            (data?.dt ?? 0) * 1000,
                          ),
                        )}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        data?.weather?.first.description ?? "",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        data?.main?.temp?.temperatureToCelsius() ?? "",
                        style: Theme.of(context).textTheme.headlineLarge,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) =>const ErrorStateWidget(),
        loading: () => const ShimmerCard(
          height: 200,
        ),
      );
    });
  }
}
