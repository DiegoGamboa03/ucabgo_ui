import 'dart:convert';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/available_trip.dart';
import 'package:ucabgo_ui/classes/landmark.dart';
import 'package:ucabgo_ui/classes/point.dart';
import 'package:ucabgo_ui/classes/trip.dart';
import 'package:ucabgo_ui/classes/trip_request.dart';
import 'package:ucabgo_ui/classes/zone.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';
import 'package:ucabgo_ui/providers/polygons_provider.dart';
import 'package:ucabgo_ui/providers/trips_provider.dart';

import '../providers/markers_provider.dart';
import '../providers/trips_requests_provider.dart';

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

void getTripPolygon(BuildContext context, double lat, double lng) {
  var destinationLat = lat;
  var destinationLng = lng;
  fetchAvailableTrips().then((availableTrips) {
    for (int i = 0; i < availableTrips.length; i++) {
      fetchTripPolygon(availableTrips[i].lat, availableTrips[i].lng,
              availableTrips[i].id)
          .then((trip) {
        List<LatLng> points = [];

        for (int i = 0; i < trip.polyline.length; i++) {
          points.add(LatLng(trip.polyline[i].lat, trip.polyline[i].lng));
        }

        List<mp.LatLng> polygon = [];

        for (int i = 0; i < trip.polygon.length; i++) {
          polygon.add(mp.LatLng(trip.polygon[i].lat, trip.polygon[i].lng));
        }

        var polyline = Polyline(
            polylineId: PolylineId(trip.username),
            points: points,
            color: Colors.red);
        var point = mp.LatLng(destinationLat, destinationLng);

        var contains = mp.PolygonUtil.containsLocation(point, polygon, false);

        if (contains) {
          Provider.of<Trips>(context, listen: false).addTrip(trip);
          //Provider.of<Polylines>(context, listen: false).addPolyline(polyline);
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
        .toList();

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

void offerTrip(
    BuildContext context,
    String departureTime,
    String lat,
    String lng,
    String meetingPoint,
    String numberPassengers,
    String driverID) async {
  Map<String, dynamic> jsonMap = {
    'departureTime': departureTime,
    'latitud': lat,
    'longitud': lng,
    'meetingPoint': meetingPoint,
    'numberPassengers': numberPassengers,
  };
  http.post(Uri.parse('$apiDirection/trip/$driverID/add'),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: jsonMap);
}

Future getTripRequest(BuildContext context, String driverID) async {
  fetchTripsRequest(driverID).then((value) {
    Provider.of<TripsRequests>(context, listen: false).addTripsRequest(value);
    print(Provider.of<TripsRequests>(context, listen: false).tripsRequest);
  });
}

//6388307e4ec2aed0037b2d56
Future<List<TripRequest>> fetchTripsRequest(String driverID) async {
  final response =
      await http.get(Uri.parse('$apiDirection/goOnTrip/solicitudes/$driverID'));
  String d = '$apiDirection/goOnTrip/solicitudes/$driverID';
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    dynamic data = jsonDecode(response.body);
    return data
        .map((element) => TripRequest.fromJson(element))
        .toList()
        .cast<TripRequest>();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
