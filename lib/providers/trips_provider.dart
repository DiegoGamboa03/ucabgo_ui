import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/trip.dart';
import 'package:ucabgo_ui/classes/zone.dart';

class Trips with ChangeNotifier {
  List<Trip> _trips = [];

  List<Trip> get trips => _trips;

  void addTrip(Trip value) {
    _trips.add(value);
    notifyListeners();
  }

  void eraseTrip() {
    _trips = [];
    notifyListeners();
  }
}
