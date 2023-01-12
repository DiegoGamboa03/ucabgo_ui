import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripType with ChangeNotifier {
  String _tripType = 'passenger';

  String get tripType => _tripType;

  void changeTripType() {
    if (_tripType == 'passenger') {
      _tripType = 'rider';
    } else {
      _tripType = 'passenger';
    }
    notifyListeners();
  }
}
