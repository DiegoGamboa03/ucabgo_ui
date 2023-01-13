import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/helpers/api_service.dart';
import '../providers/landmarks_provider.dart';

class DraggableScrollableSheetRider extends StatefulWidget {
  const DraggableScrollableSheetRider({super.key});

  @override
  State<DraggableScrollableSheetRider> createState() =>
      _DraggableScrollableSheetRider();
}

class _DraggableScrollableSheetRider
    extends State<DraggableScrollableSheetRider> {
  List<String> meetingPlaces = [
    'Los patos',
    'Parada de cola',
    'Estacionamiento dentro de la ucab',
    'Parada arriba'
  ];

  String selectedItem = '';
  String meetingPlace = '';
  int numberPassengers = 1;
  TimeOfDay departureTime = TimeOfDay.now();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (selectedItem == '') {
      selectedItem = context.watch<Landmarks>().getLandmarksNameList().first;
    }

    if (meetingPlace == '') {
      meetingPlace = meetingPlaces.first;
    }

    return Column(
      children: [
        const Text('Estas en rider'),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const FaIcon(FontAwesomeIcons.locationDot),
              DropdownButton<String>(
                value: selectedItem,
                items: context
                    .watch<Landmarks>()
                    .getLandmarksNameList()
                    .map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value!),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedItem = value!;
                  });
                },
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const FaIcon(FontAwesomeIcons.locationDot),
              DropdownButton<String>(
                value: meetingPlace,
                items: meetingPlaces
                    .map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value!),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    meetingPlace = value!;
                  });
                },
              ),
            ],
          ),
        ),
        TextField(
          controller: controller,
          decoration:
              const InputDecoration.collapsed(hintText: 'Hora de salida'),
          readOnly: true,
          onTap: () {
            Future<TimeOfDay?> time = showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            time.then((value) {
              if (value != null) {
                controller.value =
                    TextEditingValue(text: value.format(context).toString());
              }
            });
          },
        ),
        SpinBox(
          min: 1,
          max: 8,
          value: 1,
          decoration: const InputDecoration(labelText: 'Cantidad de pasajeros'),
          onChanged: (value) => print(value),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: OutlinedButton(
              onPressed: () {
                var latlng = Provider.of<Landmarks>(context, listen: false)
                    .getLandmarkPointFromName(selectedItem);
                if (latlng != null) {
                  final now = DateTime.now();

                  offerTrip(
                      context,
                      DateTime(now.year, now.month, now.day, departureTime.hour,
                              departureTime.minute)
                          .toString(),
                      latlng.latitude.toString(),
                      latlng.longitude.toString(),
                      meetingPlace,
                      numberPassengers.toString());
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.lightGreen),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          side: BorderSide(color: Colors.lightGreen))),
                  fixedSize: MaterialStateProperty.all<Size>(
                      Size(width * 0.4, height * 0.05))),
              child: const Text('Quiero dar una cola')),
        ),
      ],
    );
  }
}
