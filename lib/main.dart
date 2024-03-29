import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/classes/trip_request_rider.dart';
import 'package:ucabgo_ui/pages/login.dart';
import 'package:ucabgo_ui/pages/splashscreen.dart';
import 'package:ucabgo_ui/pages/trip_page.dart';
import 'package:ucabgo_ui/pages/trips_requests_page_passenger.dart';
import 'package:ucabgo_ui/pages/trips_requests_page_rider.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';
import 'package:ucabgo_ui/providers/markers_provider.dart';
import 'package:ucabgo_ui/providers/polygons_provider.dart';
import 'package:ucabgo_ui/providers/polylines_provider.dart';
import 'package:ucabgo_ui/providers/trip_type_provider.dart';
import 'package:ucabgo_ui/providers/trips_provider.dart';
import 'package:ucabgo_ui/providers/trips_requests_passenger_provider.dart';
import 'package:ucabgo_ui/providers/trips_requests_rider_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Markers()),
        ChangeNotifierProvider(create: (_) => Polygons()),
        ChangeNotifierProvider(create: (_) => Polylines()),
        ChangeNotifierProvider(create: (_) => Landmarks()),
        ChangeNotifierProvider(create: (_) => Trips()),
        ChangeNotifierProvider(create: (_) => TripType()),
        ChangeNotifierProvider(create: (_) => TripsRequestsRider()),
        ChangeNotifierProvider(create: (_) => TripsRequestsPassenger()),
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
        '/tripsRequestRiderPage': (context) => const TripRequestRiderPage(),
        '/tripsRequestPassengerPage': (context) =>
            const TripsRequestPassengerPage(),
      },
    );
  }
}
