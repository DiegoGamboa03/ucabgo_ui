import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/components/trip_card.dart';

import '../helpers/api_service.dart';
import '../providers/landmarks_provider.dart';
import '../providers/polylines_provider.dart';
import '../providers/trips_provider.dart';

class DraggableScrollableSheetPassenger extends StatefulWidget {
  const DraggableScrollableSheetPassenger({super.key});

  @override
  State<DraggableScrollableSheetPassenger> createState() =>
      _DraggableScrollableSheetPassengerState();
}

class _DraggableScrollableSheetPassengerState
    extends State<DraggableScrollableSheetPassenger> {
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    if (selectedItem == '') {
      selectedItem = context.watch<Landmarks>().getLandmarksNameList().first;
    }
    return Column(
      children: [
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
                    Provider.of<Polylines>(context, listen: false)
                        .erasePolyline();
                    Provider.of<Trips>(context, listen: false).eraseTrip();
                    selectedItem = value!;
                    var latlng = Provider.of<Landmarks>(context, listen: false)
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
        Provider.of<Trips>(context, listen: true).trips.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    Provider.of<Trips>(context, listen: true).trips.length,
                itemBuilder: (BuildContext context, int index) {
                  if (Provider.of<Trips>(context, listen: false)
                      .trips
                      .isNotEmpty) {
                    return TripCard(
                        trip: Provider.of<Trips>(context, listen: true)
                            .trips[index]);
                  }
                  return Container();
                },
              )
            : const Text('No hay viajes disponibles')
      ],
    );
  }
}
