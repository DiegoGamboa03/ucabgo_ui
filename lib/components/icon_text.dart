import 'package:flutter/material.dart';

///Muestra un icono y un texto, pensado para usar dentro de las tarjetas de usuario
class IconText extends StatelessWidget {
  final String message;
  final IconData icon;

  const IconText({super.key, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(
          top: height * 0.01, left: width * 0.07, right: width * 0.07),
      child: Row(children: [Icon(icon), Text(message)]),
    );
  }
}
