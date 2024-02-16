import 'package:farm_setu_assignment/core/presentation/views/base_view.dart';
import 'package:farm_setu_assignment/core/presentation/widgets/shimmer_card.dart';
import 'package:farm_setu_assignment/features/current_weather/presentation/views/current_weather_card.view.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/views/forecast_card.view.dart';
import 'package:farm_setu_assignment/features/weather_map/presentation/views/weather_map_card.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends StatelessWidget {
  final double? lat;
  final double? long;
  const HomePageView({super.key, this.lat, this.long});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: Consumer(builder: (context, ref, child) {
        final currentWeather =
            ref.watch(currentWeatherViewFutureProvider((lat!, long!)));

        return currentWeather.when(
          data: (data) => Row(children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(
              width: 4,
            ),
            Text(data?.name ?? "")
          ]),
          error: (error, stackTrace) => SingleChildScrollView(
            child: Center(
                child: Text(
              "$error\n\n${stackTrace.toString()}",
              style: const TextStyle(color: Colors.red),
            )),
          ),
          loading: () => const ShimmerCard(
            height: 30,
            width: 150,
            radius: 8,
          ),
        );
      }),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CurrentWeatherCard(
              lat: lat,
              long: long,
            ),
            ForecastCard(
              lat: lat,
              long: long,
            ),
            const WeatherMapCard()
          ],
        ),
      ),
    );
  }
}
