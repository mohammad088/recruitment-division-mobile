import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';

void dialog(String text){
Get.dialog(Center(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.red)),
        elevation: 7,
        child: SizedBox(
          width: Config.screenWidth! * 0.7,
          height: Config.screenHeight! * 0.3,
          child: Column(
            children: [
              Config.spaceSmall,
               Text(
                text,
                textAlign: TextAlign.center,
                style:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const Divider(
                color: Colors.brown,
                thickness: 3,
                indent: 15,
                endIndent: 15,
              ),
              const Spacer(),
              SizedBox(
                width: Config.screenWidth! * 0.3,
                height: Config.screenHeight! * 0.06,
                child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () => Get.back(),
                    child: const Text('حسنا')),
              ),
              Config.spaceSmall
            ],
          ),
        ),
      ),
    ));
  }