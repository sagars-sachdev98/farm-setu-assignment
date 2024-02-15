import 'dart:typed_data';

import 'package:farm_setu_assignment/features/weather_map/data/repositories/weather_map.repository.dart';
import 'package:farm_setu_assignment/features/weather_map/data/repositories/weather_map_impl.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final weatherMapViewModelProvider = Provider.family<TileProvider, String>(
    (ref, mapType) =>
        WeatherMapsViewModel(ref.read(weatherMapRepositoryProvider),mapType));

class WeatherMapsViewModel implements TileProvider {
  WeatherMapsViewModel(this._repository,this.mapType);

  final WeatherMapRepository _repository;
  final String mapType;

  Tile transTile = Tile(0, 0, Uint8List.fromList([1]));
  Tile actualTile = Tile(0, 0, Uint8List.fromList([1]));

  int tileSize = 256;

  // Future<Tile> fetchWeatherMapTile(
  //     String mapType, int x, int y, int? zoom) async {

  // }

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    zoom = zoom ?? 1;

    if (zoom >= 1 && zoom <= 20) {
      try {
        final response = await _repository.getWeatherMap(mapType, x, y, zoom);
        actualTile = Tile(tileSize, tileSize, response?.uint8list);
        return actualTile;
      } catch (e) {
        return transTile;
      }
    }
    return transTile;
  }
}
