import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucabgo_ui/classes/trip_request_passenger.dart';
import 'package:ucabgo_ui/classes/trip_request_rider.dart';

class TripRequestCard extends StatelessWidget {
  final TripRequestPassenger tripRequest;
  const TripRequestCard({super.key, required this.tripRequest});

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
            onTap: () {},
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
                        tripRequest.driverName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontSize: 14),
                      ),
                    ),
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
