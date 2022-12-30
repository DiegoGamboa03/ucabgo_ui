import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/zone.dart';

class Polygons with ChangeNotifier {
  final Set<Polygon> _polygons = HashSet<Polygon>();

  Set<Polygon> get polygons => _polygons;

  void addZones(List<Polygon> value) {
    _polygons.addAll(value);
    notifyListeners();
  }
}
