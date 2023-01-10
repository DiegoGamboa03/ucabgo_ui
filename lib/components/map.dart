import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/providers/markers_provider.dart';
import '../helpers/map_helpers.dart';
import '../providers/polygons_provider.dart';

class AppMap extends StatefulWidget {
  const AppMap({super.key});

  @override
  State<AppMap> createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      //zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController c) {
        mapController = c;
        changeMapMode(mapController);
      },
      initialCameraPosition: const CameraPosition(
          zoom: 17, target: LatLng(8.296805712036571, -62.71160479227906)),
      polygons: context.watch<Polygons>().polygons,
      markers: context.watch<Markers>().markers,
    );
  }
}
