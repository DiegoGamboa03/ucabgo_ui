import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../classes/landmark.dart';

class Landmarks with ChangeNotifier {
  final List<Landmark> _items = [];

  final int selectedIndex = 0;

  List<Landmark> get landmarks => _items;

  void addLandmarks(List<Landmark> value) {
    _items.addAll(value);
    notifyListeners();
  }

  List<String> getLandmarksNameList() {
    List<String> list = [];
    print(_items.length);
    for (int i = 0; i < _items.length; i++) {
      list.add(_items[i].name);
    }
    return list;
  }
}
