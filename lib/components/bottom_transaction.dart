import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTranaction extends StatelessWidget {
  BottomTranaction({super.key , this.onPressed , this.onBackPressed});

  void Function()? onPressed;
  void Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.brown.shade700,
                ),
                onPressed: onBackPressed,
                child: const Text(
                  'رجوع',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
        Expanded(
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.green.shade700,
                ),
                onPressed: onPressed,
                child: const Text(
                  'التالي',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )))
      ],
    );
  }
}
