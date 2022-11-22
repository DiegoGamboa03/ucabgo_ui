// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ucabgo_ui/components/user_card.dart';

class CityMap extends StatelessWidget {
  const CityMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [UserCard(), UserCard()]),
    ));
  }
}
