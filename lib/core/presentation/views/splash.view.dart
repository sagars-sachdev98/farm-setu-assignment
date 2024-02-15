import 'package:farm_setu_assignment/features/home/presentation/views/home_page.view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SplashView extends StatefulWidget {
  static String routeName = "/splash_screen";

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    getLocation().then((position) => Future.delayed(
          const Duration(milliseconds: 1000),
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const HomePageView(
                    lat: 19.2215,
                    long: 73.1645,
                  );
                },
              ),
            );
          },
        ));

    super.initState();
  }

  Future<Position> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 200,
            )
          ],
        ),
      ),
    );
  }
}
