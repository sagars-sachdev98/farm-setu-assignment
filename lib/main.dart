
import 'package:farm_setu_assignment/core/presentation/views/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff01131B), // Navigation bar color
        statusBarColor: Color(0xff01131B), // Status bar color
      ),
    );
    return ProviderScope(
      // overrides: [
      //         stockScanDataSourceProvider.overrideWith(
      //             (ref) => ref.read(mockStockScanDataSourceProvider)),
      //       ],
      child: MaterialApp(
        title: 'Farm Setu task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff01131B),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff1686b0),
            centerTitle: false,
            titleTextStyle: TextStyle(
              fontSize: 16.0, // Set the desired font size
            ),
          ),
          textTheme: const TextTheme(
            bodyLarge:
                TextStyle(color: Colors.white), // Set the default text color
            bodyMedium:
                TextStyle(color: Colors.white), // Set the default text color
            // You can customize other text styles as needed
          ),
        ),
        // routes: NavigationUtils.generateRoute(),
        home: const SplashView(),
      ),
    );
  }
}
