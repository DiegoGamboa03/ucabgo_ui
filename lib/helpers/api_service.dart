import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/landmark.dart';
import 'package:ucabgo_ui/classes/zone.dart';

List<Polygon> getZones() {
  Zone zone;
  //estos points tengo que obtenerlos de la api
  List<LatLng> points = [
    const LatLng(8.2968527, -62.7117946),
    const LatLng(8.2965767, -62.7116229),
    const LatLng(8.296736, -62.7113842),
    const LatLng(8.2970014, -62.7115237),
    const LatLng(8.2968527, -62.7117946)
  ];

  zone = Zone(points);

  List<Zone> zones = [];

  zones.add(zone);

  List<Polygon> polygons = [];
  for (int i = 0; i < zones.length; i++) {
    polygons.add(Polygon(
      polygonId: PolygonId(i.toString()),
      points: zones[i].points,
      fillColor: Colors.black.withOpacity(0.3),
      strokeColor: Colors.black,
      geodesic: true,
      strokeWidth: 4,
    ));
  }
  return polygons;
}

List<Marker> getLandmarks() {
  List<Landmark> landmarks = [];
  List<Marker> markers = [];

  late Future<List<dynamic>> futureLandmarkList;

  futureLandmarkList = fetchLandmarkList();

  futureLandmarkList.then((value) => (value) {
        landmarks = value;
        List<Marker> markers = [];
        for (int i = 0; i < landmarks.length; i++) {
          markers.add(Marker(
              markerId: MarkerId(i.toString()),
              position: landmarks[i].point,
              infoWindow: const InfoWindow(
                title: 'My Position',
              )));
        }
        return markers;
      });
  //var landmark = Landmark(LatLng(8.2967921, -62.7115856));
  //landmarks.add(landmark);
  return markers;
}

Future<List> fetchLandmarkList() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.109:3000/data/landmarks'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    dynamic data = jsonDecode(response.body);
    return data.map((element) => Landmark.fromJson(element)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
