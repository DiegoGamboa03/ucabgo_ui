import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ucabgo_ui/helpers/api_service.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.1),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: const Icon(
            Icons.notifications_outlined, //Icons.notifications
            color: Colors.lightGreen,
          ),
          onPressed: () {
            getTripRequest(context, '6388307e4ec2aed0037b2d56');
          },
        ),
      ),
    );
  }
}
