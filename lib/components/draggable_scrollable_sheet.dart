import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/components/draggable_scrollable_sheet_rider.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';
import 'package:ucabgo_ui/providers/trip_type_provider.dart';
import 'draggable_scrollable_sheet_passenger.dart';

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
                  context.watch<TripType>().tripType == 'passenger'
                      ? const DraggableScrollableSheetPassenger()
                      : const DraggableScrollableSheetRider()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
