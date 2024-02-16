
import 'package:farm_setu_assignment/features/forecast/data/models/main.model.dart';
import 'package:farm_setu_assignment/features/forecast/data/utils/temperature.dart';
import 'package:farm_setu_assignment/features/forecast/presentation/widgets/weather_icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ForecastItem extends ConsumerWidget {
  const ForecastItem(
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
