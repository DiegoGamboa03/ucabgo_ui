import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/draggable_scrollable_sheet.dart';
import '../components/map.dart';
import '../helpers/api_service.dart';

///Sobre esta page, se encuentran todos los elementos de la UI para buscar
///o realizar colas
class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body:
            Stack(children: const [AppMap(), DraggableScrollableSheetTrip()]));
  }
}
