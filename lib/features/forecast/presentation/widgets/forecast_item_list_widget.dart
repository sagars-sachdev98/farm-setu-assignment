import 'package:farm_setu_assignment/features/forecast/data/models/weather_list.model.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/widgets/forecast_item_widget.dart';
import 'package:flutter/material.dart';

class ForecastItemList extends StatelessWidget {
  const ForecastItemList({super.key, required this.weatherDataItems});
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
                  ForecastItem(
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