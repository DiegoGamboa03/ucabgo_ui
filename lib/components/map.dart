import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/map_helpers.dart';

class AppMap extends StatefulWidget {
  const AppMap({super.key});

  @override
  State<AppMap> createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  late GoogleMapController mapController;

  final Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    const LatLng(8.2968527, -62.7117946),
    const LatLng(8.2965767, -62.7116229),
    const LatLng(8.296736, -62.7113842),
    const LatLng(8.2970014, -62.7115237),
    const LatLng(8.2968527, -62.7117946)
  ];

  @override
  void initState() {
    super.initState();
    _polygon.add(Polygon(
      polygonId: const PolygonId('1'),
      points: points,
      fillColor: Colors.black.withOpacity(0.3),
      strokeColor: Colors.black,
      geodesic: true,
      strokeWidth: 4,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: (GoogleMapController c) {
          mapController = c;
          changeMapMode(mapController);
        },
        polygons: _polygon,
        initialCameraPosition: const CameraPosition(
            zoom: 17, target: LatLng(8.296805712036571, -62.71160479227906)));
  }
}
