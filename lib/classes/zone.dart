import 'package:google_maps_flutter/google_maps_flutter.dart';

class Zone {
  List<LatLng> points;
  String name;
  String id;

  Zone({required this.points, required this.id, required this.name});

  factory Zone.fromJson(Map<String, dynamic> json) {
    List<LatLng> points = [];
    for (int i = 0; i < json['arrVert'].length; i++) {
      var lat = double.parse(json['arrVert'][i]['lat']);
      var lng = double.parse(json['arrVert'][i]['lng']);
      var latlng = LatLng(lat, lng);
      points.add(latlng);
    }
    return Zone(
      points: points,
      id: json['_id'],
      name: json['name'],
    );
  }
}
