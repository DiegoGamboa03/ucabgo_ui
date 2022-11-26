import 'package:flutter/material.dart';
import 'package:ucabgo_ui/pages/login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const GoogleMap(
            initialCameraPosition: CameraPosition(
                zoom: 15,
                target: LatLng(52.52309894124325, 13.413122125924026))));
  }
}
