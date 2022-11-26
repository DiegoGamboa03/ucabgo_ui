import 'package:flutter/material.dart';

class IconInput extends StatelessWidget {
  final String labelText;
  final IconData icon;

  const IconInput({super.key, required this.labelText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(icon),
          Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: labelText,
              ),
              onChanged: (value) {
                //hacer que le pasen una funcion o un controllador para poder obtener el valor de este input
              },
            ),
          ),
        ],
      ),
    );
  }
}
