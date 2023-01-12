import 'package:flutter/material.dart';
import 'package:ucabgo_ui/classes/trip.dart';

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
