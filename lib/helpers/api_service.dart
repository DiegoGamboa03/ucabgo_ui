import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/available_trip.dart';
import 'package:ucabgo_ui/classes/landmark.dart';
import 'package:ucabgo_ui/classes/point.dart';
import 'package:ucabgo_ui/classes/trip.dart';
import 'package:ucabgo_ui/classes/zone.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';
import 'package:ucabgo_ui/providers/polygons_provider.dart';
import 'package:ucabgo_ui/providers/trips_provider.dart';

import '../providers/markers_provider.dart';

String apiDirection = 'http://192.168.1.109:3000';

Future getZones(BuildContext context) async {
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
}

Future<List> fetchZonesList() async {
  final response = await http.get(Uri.parse('$apiDirection/data/subareas'));

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

Future getLandmarks(BuildContext context) async {
  List<Landmark> landmarks = [];

  fetchLandmarkList().then((value) {
    List<Marker> markers = [];
    for (int i = 0; i < value.length; i++) {
      markers.add(Marker(
          markerId: MarkerId(value[i].id),
          position: value[i].point,
          infoWindow: InfoWindow(
            title: value[i].name,
          )));
      landmarks.add(Landmark(
          point: value[i].point, name: value[i].name, id: value[i].id));
    }
    Provider.of<Markers>(context, listen: false).addMarkers(markers);

    Provider.of<Landmarks>(context, listen: false).addLandmarks(landmarks);
    return;
  });
}

Future<List> fetchLandmarkList() async {
  final response = await http.get(Uri.parse('$apiDirection/data/landmarks'));

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

void getTripPolygon(BuildContext context) {
  fetchAvailableTrips().then((availableTrips) {
    for (int i = 0; i < availableTrips.length; i++) {
      fetchTripPolygon(availableTrips[i].lat, availableTrips[i].lng,
              availableTrips[i].id)
          .then((trip) {
        List<LatLng> points = [];
        List<mp.LatLng> polygon = [];
        for (int i = 0; i < trip.polygon.length; i++) {
          points.add(trip.polygon[i].point);
          polygon.add(mp.LatLng(trip.polygon[i].lat, trip.polygon[i].lng));
        }

        var routePolygon = Polygon(
          polygonId: PolygonId(trip.username),
          points: points,
          fillColor: Colors.black.withOpacity(0.3),
          strokeColor: Colors.red,
          geodesic: true,
          strokeWidth: 4,
        );

        var point = mp.LatLng(8.2998008, -62.7298523);

        var contains = mp.PolygonUtil.containsLocation(point, polygon, false);

        if (contains) {
          Provider.of<Trips>(context, listen: false).addTrip(trip);
          Provider.of<Polygons>(context, listen: false).addZone(routePolygon);
        }

        return;
      });
    }
  });
  return;
}

Future<Trip> fetchTripPolygon(var lat, var lng, var id) async {
  final response =
      await http.get(Uri.parse('$apiDirection/polygon/generate/$lat/$lng/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    dynamic data = jsonDecode(response.body);
    var polygon =
        data['polygon'].map((element) => Position.fromJson(element)).toList();
    var username = data['username'];
    var polyline = data['polyline']
        .map((element) => Position(lat: element[0], lng: element[1]))
        .toList()
        .cast<List<Position>>();

    return Trip(polygon: polygon, username: username, polyline: polyline);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load specialZone');
  }
}

Future<List> fetchAvailableTrips() async {
  final response = await http.get(Uri.parse('$apiDirection/trip/available'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    dynamic data = jsonDecode(response.body);
    return data
        .map((element) => AvailableTrip.fromJson(element))
        .toList()
        .cast<AvailableTrip>();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load specialZone');
  }
}
