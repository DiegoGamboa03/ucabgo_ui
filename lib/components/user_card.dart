import 'package:flutter/material.dart';
import 'package:ucabgo_ui/components/icon_text.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      //Contenedor externo para margenes con otros elementos
      margin: EdgeInsets.only(
          top: height * 0.01, right: width * 0.025, left: width * 0.025),
      child: ClipRRect(
        //Rectangulo Redondeado
        borderRadius: BorderRadius.circular(40),
        child: Material(
          //Color
          color: Colors.lightGreen,
          child: InkWell(
            //InkWell para efecto splash y funcion onTap
            onTap: () {},
            child: Container(
              color: Colors.transparent,
              height: height * 0.1,
              width: width * 0.95,
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network('https://picsum.photos/250?image=9'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(children: [
                    const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Diego Alexander Gamboa Rojas',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontSize: 14),
                      ),
                    ),
                    Row(
                      children: const [
                        IconText(message: '4', icon: Icons.access_alarm),
                        IconText(message: '5', icon: Icons.android),
                        IconText(message: '6', icon: Icons.apartment),
                      ],
                    )
                  ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
