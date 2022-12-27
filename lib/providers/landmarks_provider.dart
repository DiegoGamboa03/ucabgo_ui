import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Markers with ChangeNotifier {
  final Set<Marker> _markers = HashSet<Marker>();

  Set<Marker> get markers => _markers;

  void addMarkers(List<Marker> value) {
    _markers.addAll(value);
    notifyListeners();
  }
}
