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

  var landmark = Landmark(LatLng(8.2967921, -62.7115856));
  landmarks.add(landmark);

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
}
