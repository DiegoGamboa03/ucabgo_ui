import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/trip_type_provider.dart';

class RiderPassengerButton extends StatelessWidget {
  const RiderPassengerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: height * 0.1),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  if (Provider.of<TripType>(context, listen: false).tripType ==
                      'passenger') {
                    Provider.of<TripType>(context, listen: false)
                        .changeTripType();
                  }
                },
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Colors.lightGreen),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0),
                                bottomLeft: Radius.circular(18.0)),
                            side: BorderSide(color: Colors.lightGreen))),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(width * 0.4, height * 0.05))),
                child: const Text('Quiero dar una cola')),
            OutlinedButton(
                onPressed: () {
                  if (Provider.of<TripType>(context, listen: false).tripType ==
                      'rider') {
                    Provider.of<TripType>(context, listen: false)
                        .changeTripType();
                  }
                },
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Colors.lightGreen),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18.0),
                                bottomRight: Radius.circular(18.0)),
                            side: BorderSide(color: Colors.lightGreen))),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(width * 0.4, height * 0.05))),
                child: const Text('Quiero que me den una cola')),
          ],
        ),
      ),
    );
  }
}
