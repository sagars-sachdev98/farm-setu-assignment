import 'package:farm_setu_assignment/core/constant/api_keys.dart';
import 'package:farm_setu_assignment/features/weather_map/presentation/viewmodels/weather_maps.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:weather/features/map/data/datasources/map_remote_data_source.dart';
// import 'package:weather/features/map/domain/usecases/get_map.dart';
// import 'package:weather/features/map/presentation/bloc/map_bloc.dart';

// final weatherMapViewFutureProvider =
//     FutureProvider.family.autoDispose<TileProvider?, String>(
//   (ref, coords) async {
//     final currentWeatherViewModel = ref.read(weatherMapViewModelProvider);
//     return currentWeatherViewModel;
//   },
// );

class MapPage extends StatelessWidget {
  // late final GoogleMapController mapController;

  // final LatLng latLng = const LatLng(0.0, 0.0);

  // bool isTempMap = false;

  MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Consumer(builder: (context, ref, child) {
        return FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(0, 0),
            // minZoom: 17.0,
            maxZoom: 1,
            initialZoom: 30,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  "https://tile.openweathermap.org/map/temp_new/1/0/0.png?appid=${APIKeys.openWeatherAPIKey}",
              //change base_snow_map to pistes
              // subdomains: ['a', 'b', 'c'],
            ),
            // TileLayer(
            //     urlTemplate:
            //         "https://snowmap.fast-sfc.com/pistes/{z}/{x}/{y}.png",
            //     //change base_snow_map to pistes
            //     subdomains: ['a', 'b', 'c'],
            //     backgroundColor: Colors.transparent),
          ],
        );
      }),
    );
  }

  // TileProvider tileProvider(String mapType) {
  //   print("counttileProvider");
  //   return GetMap(
  //     mapType: mapType,
  //     mapRemoteDataSource: MapRemoteDataSourceImpl(),
  //   );
  // }

  // void setControler(GoogleMapController controller) {
  //   mapController = controller;
  // }
}
