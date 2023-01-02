import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/landmark.dart';
import 'package:ucabgo_ui/classes/position.dart';
import 'package:ucabgo_ui/classes/zone.dart';
import 'package:ucabgo_ui/providers/polygons_provider.dart';
import 'package:google_maps_utils/google_maps_utils.dart' as utils;

import '../providers/markers_provider.dart';

void getZones(BuildContext context) {
  List<dynamic> zones = [];

  fetchZonesList().then((value) {
    zones = value;

    List<Polygon> polygons = [];
    for (int i = 0; i < zones.length; i++) {
      polygons.add(Polygon(
        polygonId: PolygonId(zones[i].name),
        points: zones[i].points,
        fillColor: Colors.black.withOpacity(0.3),
        strokeColor: Colors.black,
        geodesic: true,
        strokeWidth: 4,
      ));
    }
    Provider.of<Polygons>(context, listen: false).addZones(polygons);
    return;
  });
  return;
}

Future<List> fetchZonesList() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.109:3000/data/subareas'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    dynamic data = jsonDecode(response.body);
    return data.map((element) => Zone.fromJson(element)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Zone');
  }
}

void getLandmarks(BuildContext context) {
  List<dynamic> landmarks = [];

  fetchLandmarkList().then((value) {
    landmarks = value;
    List<Marker> markers = [];
    for (int i = 0; i < landmarks.length; i++) {
      markers.add(Marker(
          markerId: MarkerId(landmarks[i].id),
          position: landmarks[i].point,
          infoWindow: InfoWindow(
            title: landmarks[i].name,
          )));
    }
    Provider.of<Markers>(context, listen: false).addMarkers(markers);
    return;
  });
  return;
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
    throw Exception('Failed to load Landmarks');
  }
}

void getSpecialZone(BuildContext context) {
  List<dynamic> specialZone = [];
  fetchSpecialZone().then((value) {
    specialZone = value;
    List<LatLng> points = [];
    List<Point> polygon = [];
    for (int i = 0; i < specialZone.length; i++) {
      points.add(specialZone[i].point);
      polygon.add(Point(specialZone[i].lng, specialZone[i].lat));
    }

    var routePolygon = Polygon(
      polygonId: const PolygonId('Ruta'),
      points: points,
      fillColor: Colors.black.withOpacity(0.3),
      strokeColor: Colors.red,
      geodesic: true,
      strokeWidth: 4,
    );

    Point point = const Point(-62.7298523, 8.2998008);

    var contains = utils.PolyUtils.containsLocationPoly(point, polygon);

    Provider.of<Polygons>(context, listen: false).addZone(routePolygon);

    return;
  });
  return;
}

Future<List> fetchSpecialZone() async {
  var lat = 8.2947236;
  var lng = -62.7323759;

  final response = await http
      .get(Uri.parse('http://192.168.1.109:3000/polygon/generate/$lat/$lng'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    dynamic data = jsonDecode(response.body);
    return data.map((element) => Position.fromJson(element)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Landmarks');
  }
}
