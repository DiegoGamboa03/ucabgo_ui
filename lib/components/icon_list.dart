import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/landmarks_provider.dart';

class IconList extends StatefulWidget {
  final String labelText;
  final IconData icon;
  List<String> list;
  IconList(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.list});

  @override
  State<IconList> createState() => _IconListState();
}

class _IconListState extends State<IconList> {
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    if (selectedItem == '') {
      selectedItem = widget.list.first;
    }
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(widget.icon),
          DropdownButton<String>(
            value: selectedItem,
            items: widget.list.map<DropdownMenuItem<String>>((String? value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value!),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedItem = value!;
                print(selectedItem);
              });
            },
          ),
        ],
      ),
    );
  }
}
