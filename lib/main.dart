import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/pages/login.dart';
import 'package:ucabgo_ui/pages/splashscreen.dart';
import 'package:ucabgo_ui/pages/trip_page.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';
import 'package:ucabgo_ui/providers/markers_provider.dart';
import 'package:ucabgo_ui/providers/polygons_provider.dart';
import 'package:ucabgo_ui/providers/trips_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Markers()),
        ChangeNotifierProvider(create: (_) => Polygons()),
        ChangeNotifierProvider(create: (_) => Landmarks()),
        ChangeNotifierProvider(create: (_) => Trips()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/splashScreen': (context) => SplashPage(),
        '/tripPage': (context) => const TripPage(),
      },
    );
  }
}
