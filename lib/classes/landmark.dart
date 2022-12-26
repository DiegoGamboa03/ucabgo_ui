import 'package:google_maps_flutter/google_maps_flutter.dart';

class Landmark {
  LatLng point;
  String name;
  String id;

  Landmark({required this.point, required this.name, required this.id});

  factory Landmark.fromJson(Map<String, dynamic> json) {
    var lat = double.parse(json['lat']);
    var lng = double.parse(json['lng']);
    return Landmark(
      point: LatLng(lat, lng),
      id: json['_id'],
      name: json['name'],
    );
  }
}
