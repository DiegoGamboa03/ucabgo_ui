import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/classes/trip.dart';
import 'package:ucabgo_ui/classes/user.dart';
import 'package:ucabgo_ui/components/icon_text.dart';

import '../helpers/api_service.dart';
import '../providers/polylines_provider.dart';

///Widget para las tarjetas de usuario, permite mostrar la informacion del usuario
class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    int timesPressed = 0;

    return Container(
      margin: EdgeInsets.only(
          top: height * 0.01, right: width * 0.025, left: width * 0.025),
      child: ClipRRect(
        //Rectangulo Redondeado
        borderRadius: BorderRadius.circular(40),
        child: Material(
          //Color
          color: Colors.lightGreen,
          child: InkWell(
            onTap: () {
              timesPressed++;
              if (timesPressed == 1) {
                List<LatLng> points = [];
                for (int i = 0; i < trip.polyline.length; i++) {
                  points
                      .add(LatLng(trip.polyline[i].lat, trip.polyline[i].lng));
                }
                var polyline = Polyline(
                    polylineId: PolylineId(trip.username),
                    points: points,
                    color: Colors.red);

                Provider.of<Polylines>(context, listen: false)
                    .addPolyline(polyline);
                //Quiero que muestre el poligono
              } else if (timesPressed == 2) {
                askTrip('63b76367e00838902af30c16', trip.id);
              } else {
                timesPressed = 0;
              }
            },
            child: Container(
              color: Colors.transparent,
              height: height * 0.1,
              width: width * 0.95,
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network('https://picsum.photos/250?image=9'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(children: [
                    FittedBox(
                      // hacer mas pruebas si esto realmente ayuda a escalar el texto
                      fit: BoxFit.contain,
                      child: Text(
                        trip.username.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontSize: 14),
                      ),
                    ),
                    Row(
                      children: const [
                        IconText(message: '4', icon: Icons.access_alarm),
                        IconText(message: '5', icon: Icons.android),
                        IconText(message: '6', icon: Icons.apartment),
                      ],
                    )
                  ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
