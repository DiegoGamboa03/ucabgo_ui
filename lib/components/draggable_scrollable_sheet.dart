import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/classes/user.dart';
import 'package:ucabgo_ui/components/icon_input.dart';
import 'package:ucabgo_ui/components/icon_list.dart';
import 'package:ucabgo_ui/components/user_card.dart';
import 'package:ucabgo_ui/providers/landmarks_provider.dart';

class DraggableScrollableSheetTrip extends StatefulWidget {
  const DraggableScrollableSheetTrip({super.key});

  @override
  State<DraggableScrollableSheetTrip> createState() =>
      _DraggableScrollableSheetTripState();
}

class _DraggableScrollableSheetTripState
    extends State<DraggableScrollableSheetTrip> {
  List<String> landmarksString = [];

  @override
  Widget build(BuildContext context) {
    var usersList = [
      User(id: '1', name: '1', password: '1'),
      User(id: '2', name: '2', password: '2'),
    ];

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
                  IconList(
                    labelText: 'Landmarks',
                    icon: Icons.panorama_horizontal_outlined,
                    list: context.watch<Landmarks>().getLandmarksNameList(),
                  ),
                  IconList(
                      labelText: '1',
                      icon: Icons.addchart_outlined,
                      list: const ['Los patos', 'Modulo 3', 'Cancha']),
                  const IconInput(
                      labelText: '1', icon: Icons.addchart_outlined),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(user: usersList[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
