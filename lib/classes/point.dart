import 'package:google_maps_flutter/google_maps_flutter.dart';

//Originalmente esta clase se llamaba point lo tuve cambiar porque tenia conflicto con la libreria utils
class Position {
  LatLng point;
  var lat;
  var lng;

  Position(
      {this.point = const LatLng(0, 0), required this.lat, required this.lng});

  factory Position.fromJson(Map<String, dynamic> json) {
    var lat = json['lat'];
    var lng = json['lng'];
    return Position(point: LatLng(lat, lng), lat: lat, lng: lng);
  }
}
