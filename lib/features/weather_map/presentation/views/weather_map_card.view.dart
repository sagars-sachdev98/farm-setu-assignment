import 'package:farm_setu_assignment/features/weather_map/presentation/viewmodels/weather_maps.viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WeatherMapCard extends StatelessWidget {
  final LatLng latLng = const LatLng(0.0, 0.0);

  const WeatherMapCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: double.infinity,
        height: 340,
        child: Consumer(builder: (context, ref, child) {
          final weatherMapViewModel =
              ref.watch(weatherMapViewModelProvider(("temp_new")));
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Stack(
              children: [
                GoogleMap(
                  tileOverlays: {
                    TileOverlay(
                      tileOverlayId:
                          TileOverlayId('${weatherMapViewModel.mapType}_id'),
                      tileProvider: weatherMapViewModel.tileProvider,
                    )
                  },
                  initialCameraPosition: CameraPosition(
                    target: latLng,
                    zoom: 1,
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Icon(
                          Icons.layers_outlined,
                          size: 30,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        onTapDown: (details) => weatherMapViewModel
                            .showPopUpMenuAtTap(context, details),
                      ),
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
