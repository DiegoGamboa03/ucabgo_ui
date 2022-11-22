import 'package:flutter/material.dart';

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
          color: Colors.pink,
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
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
