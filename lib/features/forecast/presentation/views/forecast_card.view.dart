import 'package:farm_setu_assignment/core/presentation/widgets/shimmer_card.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/forecast.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/main.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/models/weather_list.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/utils/temperature.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/viewmodels/forecast.viewmodel.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/widgets/weather_icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

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
            return HourlyWeatherRow(
              weatherDataItems: [
                for (var i in items) data!.list![i],
              ],
            );
          },
          error: (error, stackTrace) {
            print("$error\n\n${stackTrace.toString()}");
            return SingleChildScrollView(
              child: Center(
                  child: Text(
                "$error\n\n${stackTrace.toString()}",
                style: const TextStyle(color: Colors.red),
              )),
            );
          },
          loading: () => const ShimmerCard(height: 380),
        );
      }),
    );
  }
}

class HourlyWeatherRow extends StatelessWidget {
  const HourlyWeatherRow({super.key, required this.weatherDataItems});
  final List<WeatherListModel> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.date_range,
                  size: 32,
                ),
                const SizedBox(width: 16), // Adjust spacing as needed
                Text(
                  "5-day forecast",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          ...weatherDataItems.map(
            (data) {
              final isLastItem = weatherDataItems.last == data;
              return Column(
                children: [
                  HourlyWeatherItem(
                    data: data.main!,
                    date: DateTime.fromMillisecondsSinceEpoch(
                      (data.dt ?? 0) * 1000,
                    ),
                    icon: data.weather?.first.icon ?? "",
                    weatherDesc: data.weather?.first.main ?? "",
                  ),
                  if (!isLastItem) const Divider(),
                ],
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}

class HourlyWeatherItem extends ConsumerWidget {
  const HourlyWeatherItem(
      {super.key,
      required this.data,
      required this.date,
      required this.icon,
      required this.weatherDesc});
  final MainModel data;
  final DateTime date;
  final String icon;
  final String weatherDesc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            WeatherIconImage(iconUrl: icon.iconUrl2x, size: 48),
            const SizedBox(width: 12),
            Text(
              formatDate(date),
              style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
            ),
            const SizedBox(width: 12),
            Text(
              weatherDesc,
              style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
            ),
          ],
        ),
        Text(
          data.temp!.temperatureToCelsius(),
          style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
        ),
      ],
    );
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day + 1) {
      return 'Tomorrow';
    } else {
      return DateFormat.EEEE().format(date);
    }
  }
}
