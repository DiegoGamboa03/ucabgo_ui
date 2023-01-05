import 'dart:convert';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/landmark.dart';
import 'package:ucabgo_ui/classes/zone.dart';
import 'package:ucabgo_ui/classes/user.dart';
import 'package:ucabgo_ui/providers/polygons_provider.dart';
import '../providers/markers_provider.dart';
import 'package:ucabgo_ui/providers/users_provider.dart';

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
      await http.get(Uri.parse('http://192.168.0.101:3000/data/subareas'));

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
      await http.get(Uri.parse('http://192.168.0.101:3000/data/landmarks'));

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

void getUsers(BuildContext context) {
  List<dynamic> users = [];

  fetchUserList().then((value) {
    List<User> users = [];
    for (int i = 0; i < users.length; i++) {
      users.add(User(
        id: users[i].id,
        password: users[i].password,
        name: users[i].password,
      ));
    }
    Provider.of<Users>(context, listen: false).addUsers(users);
    return;
  });
  return;
}

Future<List> fetchUserList() async {
  final response =
      await http.get(Uri.parse('http://192.168.0.101:3000/router/users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    dynamic data = jsonDecode(response.body);
    return data.map((element) => User.fromJson(element)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Users');
  }
}
