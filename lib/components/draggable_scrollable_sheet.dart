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
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      maxChildSize: 1,
      snap: true,
      snapSizes: const [
        0.55,
      ],
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
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                      color: Colors.green,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                            )
                          ]),
                    ),
                    const IconInput(
                        labelText: '1', icon: Icons.addchart_outlined),
                    const IconInput(
                        labelText: '1', icon: Icons.addchart_outlined),
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
          ),
        );
      },
    );
  }
}
