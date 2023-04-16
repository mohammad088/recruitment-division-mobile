import 'package:flutter/material.dart';

import '../utils/config.dart';

class AdminPageCard extends StatelessWidget {
  const AdminPageCard(
      {super.key,
      required this.num,
      required this.title,
      required this.icon,
      required this.color});
  final String title;
  final String num;
  final Icon icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Card(
        color: color,
        elevation: 3,
        child: SizedBox(
          width: Config.screenWidth! * 3 / 4,
          height: Config.screenHeight! * 2 / 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Config.wspaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    num,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              Stack(children: [
                Positioned(top: 30, right: 30, child: icon),
                SizedBox(
                  width: Config.screenWidth! * 0.2,
                  height: Config.screenHeight! * 2 / 8,
                  child: Image.asset(
                    'assets/circle.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
