import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/classes/user.dart';
import 'package:ucabgo_ui/components/icon_input.dart';
import 'package:ucabgo_ui/components/icon_list.dart';
import 'package:ucabgo_ui/components/trip_card.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';

import '../helpers/api_service.dart';
import '../providers/trips_provider.dart';

class DraggableScrollableSheetTrip extends StatefulWidget {
  const DraggableScrollableSheetTrip({super.key});

  @override
  State<DraggableScrollableSheetTrip> createState() =>
      _DraggableScrollableSheetTripState();
}

class _DraggableScrollableSheetTripState
    extends State<DraggableScrollableSheetTrip> {
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    if (selectedItem == '') {
      selectedItem = context.watch<Landmarks>().getLandmarksNameList().first;
    }
    return DraggableScrollableSheet(
      minChildSize: 0.05,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              color: Colors.blue[100],
              child: Column(
                children: [
                  Container(
                    color: Colors.green,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          )
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.locationDot),
                        DropdownButton<String>(
                          value: selectedItem,
                          items: context
                              .watch<Landmarks>()
                              .getLandmarksNameList()
                              .map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value!),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedItem = value!;
                              var latlng =
                                  Provider.of<Landmarks>(context, listen: false)
                                      .getLandmarkPointFromName(selectedItem);
                              if (latlng != null) {
                                getTripPolygon(
                                    context, latlng.latitude, latlng.longitude);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Provider.of<Trips>(context, listen: false).trips.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: Provider.of<Trips>(context, listen: false)
                              .trips
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return TripCard(
                                trip: Provider.of<Trips>(context, listen: false)
                                    .trips[index]);
                          },
                        )
                      : const Text('No hay viajes disponibles')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
