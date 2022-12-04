// ignore: file_names
import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/components/draggable_scrollable_sheet.dart';

import '../components/map.dart';
import '../helpers/map_helpers.dart';

///Sobre esta page, se encuentran todos los elementos de la UI para buscar
///o realizar colas
class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final height = MediaQuery.of(context).size.height;

    GoogleMapController mapController;

    return Scaffold(
        body: Stack(children: [
      AppMap()
      //const DraggableScrollableSheetTrip()
    ]));
  }
}

/*GoogleMap(
            initialCameraPosition: CameraPosition(
                zoom: 15,
                target: LatLng(52.52309894124325, 13.413122125924026))),*/
