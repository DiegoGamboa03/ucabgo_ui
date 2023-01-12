import 'package:flutter/material.dart';

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
