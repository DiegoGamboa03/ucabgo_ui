import 'package:flutter/material.dart';
import 'package:ucabgo_ui/classes/user.dart';
import 'package:ucabgo_ui/components/icon_input.dart';
import 'package:ucabgo_ui/components/user_card.dart';

class DraggableScrollableSheetTrip extends StatefulWidget {
  const DraggableScrollableSheetTrip({super.key});

  @override
  State<DraggableScrollableSheetTrip> createState() =>
      _DraggableScrollableSheetTripState();
}

class _DraggableScrollableSheetTripState
    extends State<DraggableScrollableSheetTrip> {
  @override
  Widget build(BuildContext context) {
    var usersList = [
      User(id: '1', name: '1', password: '1'),
      User(id: '2', name: '2', password: '2'),
      User(id: '3', name: '3', password: '3')
    ];

    return SizedBox.expand(
      child: DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              color: Colors.blue[100],
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: scrollController,
                children: [
                  //Aqui necesito agregar aqui un grip para el draggable_scrollable_sheet, para poder agarrarlo bien
                  const IconInput(
                      labelText: '1', icon: Icons.addchart_outlined),
                  const IconInput(
                      labelText: '1', icon: Icons.addchart_outlined),
                  const IconInput(
                      labelText: '1', icon: Icons.addchart_outlined),
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(user: usersList[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
