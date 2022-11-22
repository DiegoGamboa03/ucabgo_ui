import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
          top: height * 0.01,
          bottom: height * 0.01,
          right: width * 0.025,
          left: width * 0.025),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Material(
          color: Colors.pink,
          child: InkWell(
            onTap: () {},
            child: Container(
              color: Colors.transparent,
              height: height * 0.1,
              width: width * 0.95,
              child: Row(children: const []),
            ),
          ),
        ),
      ),
    );
  }
}
