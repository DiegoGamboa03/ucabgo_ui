import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/helpers/api_service.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';
import '../helpers/map_helpers.dart';

class AppMap extends StatefulWidget {
  const AppMap({super.key});

  @override
  State<AppMap> createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  late GoogleMapController mapController;

  final Set<Polygon> _polygon = HashSet<Polygon>();
  final Set<Marker> _marker = HashSet<Marker>();

  @override
  void initState() {
    super.initState();
    getLandmarks(context);
    _polygon.addAll(getZones());
    //_marker.addAll();
    //Quiero añadir una pantalla de carga que haga esperar que se carguen estos datos
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController c) {
        mapController = c;
        changeMapMode(mapController);
      },
      initialCameraPosition: const CameraPosition(
          zoom: 17, target: LatLng(8.296805712036571, -62.71160479227906)),
      polygons: _polygon,
      markers: context.watch<Markers>().markers,
    );
  }
}
