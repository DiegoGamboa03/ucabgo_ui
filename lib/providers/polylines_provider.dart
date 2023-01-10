import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polylines with ChangeNotifier {
  Set<Polyline> _polylines = HashSet<Polyline>();

  Set<Polyline> get polylines => _polylines;

  void addPolyline(Polyline value) {
    _polylines = <Polyline>{};
    _polylines.add(value);
    notifyListeners();
  }
}
