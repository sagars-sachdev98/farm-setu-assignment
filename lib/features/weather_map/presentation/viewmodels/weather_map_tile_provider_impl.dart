part of weather_maps_view_model;

class WeatherMapTileProviderImpl implements TileProvider {
  WeatherMapTileProviderImpl(this._repository, this.mapType);

  final WeatherMapRepository _repository;
  final String mapType;

  Tile transTile = Tile(0, 0, Uint8List.fromList([1]));
  Tile actualTile = Tile(0, 0, Uint8List.fromList([1]));

  int tileSize = 256;
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
