import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//this is the function to load custom map style json
void changeMapMode(GoogleMapController mapController) {
  getJsonFile("lib/assets/map_style.json")
      .then((value) => setMapStyle(value, mapController));
}

//helper function
void setMapStyle(String mapStyle, GoogleMapController mapController) {
  mapController.setMapStyle(mapStyle);
}

//helper function
Future<String> getJsonFile(String path) async {
  ByteData byte = await rootBundle.load(path);
  var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
  return utf8.decode(list);
}
