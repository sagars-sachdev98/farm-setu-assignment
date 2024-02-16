library weather_maps_view_model;

import 'dart:typed_data';

import 'package:farm_setu_assignment/features/weather_map/data/repositories/weather_map.repository.dart';
import 'package:farm_setu_assignment/features/weather_map/data/repositories/weather_map_impl.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'weather_map_tile_provider_impl.dart';

final weatherMapViewModelProvider =
    ChangeNotifierProvider.family<WeatherMapsViewModel, String>((ref,
            mapType) =>
        WeatherMapsViewModel(ref.read(weatherMapRepositoryProvider), mapType));

class WeatherMapsViewModel extends ChangeNotifier {
  WeatherMapsViewModel(this._repository, this.mapType) {
    tileProvider = WeatherMapTileProviderImpl(_repository, mapType);
  }

  final WeatherMapRepository _repository;

  late WeatherMapTileProviderImpl tileProvider;

  String mapType;

  bool isPrecipitation = true;

  void showPopUpMenuAtTap(BuildContext context, TapDownDetails details) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        details.globalPosition,
        details.globalPosition,
      ),
      Offset.zero & overlay.size,
    );

    final String? selectedValue = await showMenu<String>(
      context: context,
      position: position,
      shape: Theme.of(context).cardTheme.shape,
      color: Theme.of(context).cardTheme.color,
      items: [
        PopupMenuItem<String>(
            value: 'precipitation_new',
            child: Row(
              children: [
                if (mapType == 'precipitation_new')
                  const Icon(
                    Icons.check,
                  )
                else
                  const SizedBox(
                    width: 20,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'precipitation',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            )),
        PopupMenuItem<String>(
            value: 'temp_new',
            child: Row(
              children: [
                if (mapType == 'temp_new')
                  const Icon(
                    Icons.check,
                  )
                else
                  const SizedBox(
                    width: 20,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'temperature',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            )),
      ],
      elevation: 8.0,
    );

    // Handle selected value
    if (selectedValue != null) {
      mapType = selectedValue;
      updateTileProvider();
      // Add your logic here based on the selected value
    }
  }

  updateTileProvider() {
    tileProvider = WeatherMapTileProviderImpl(_repository, mapType);
    notifyListeners();
  }
}
