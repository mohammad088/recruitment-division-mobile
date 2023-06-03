import 'package:flutter/material.dart';
import '../utils/config.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({super.key, required this.child, required this.onPressed});

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Column(
      children: [
        Container(
            width: Config.screenWidth! * 0.5,
            height: Config.screenHeight! * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(25),
            ),
            child:child),
            Config.spaceSmall,
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: onPressed,
            child: const Text(
              'رفع صورة',
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
