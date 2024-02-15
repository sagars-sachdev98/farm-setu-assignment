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
          scaffoldBackgroundColor: const Color(0xff141414),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            titleTextStyle: TextStyle(
              fontSize: 16.0, // Set the desired font size
            ),
          ),
          dividerColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          cardTheme: CardTheme(
            color: const Color(0xff313131),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 64,color: Color(0xffE0FFFF),fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(color: Colors.white,fontSize: 26),
            headlineSmall: TextStyle(color: Colors.white,fontSize: 20),
            bodyLarge:
                TextStyle(color: Colors.white,fontSize: 16), // Set the default text color
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
