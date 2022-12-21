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
  //hacer una funcion que cargue los points desde la api
  List<LatLng> points = [
    const LatLng(8.2968527, -62.7117946),
    const LatLng(8.2965767, -62.7116229),
    const LatLng(8.296736, -62.7113842),
    const LatLng(8.2970014, -62.7115237),
    const LatLng(8.2968527, -62.7117946)
  ];

  final Set<Marker> _marker = HashSet<Marker>();

  //Hacer una funcion que cargue estos markers desde la api
  final List<Marker> _list = const [
// List of Markers Added on Google Map
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(8.2967921, -62.7115856),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  @override
  void initState() {
    super.initState();
    //llamaria ambas funciones y las agregaria asi
    //_polygon.addAll(elements) usar esto de addAll para cargar multiples polygons
    _polygon.add(Polygon(
      polygonId: const PolygonId('1'),
      points: points,
      fillColor: Colors.black.withOpacity(0.3),
      strokeColor: Colors.black,
      geodesic: true,
      strokeWidth: 4,
    ));
    _marker.addAll(_list);
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
      markers: _marker,
    );
  }
}
