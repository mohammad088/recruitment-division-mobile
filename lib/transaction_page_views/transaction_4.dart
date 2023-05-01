import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../utils/config.dart';

class Transaction4 extends StatelessWidget {
  const Transaction4({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Config.spaceBig,
        SizedBox(
          height: Config.screenHeight! * 0.3,
          width: Config.screenWidth! * 0.7,
          child: Lottie.asset('assets/success.json'),
        ),
        const Spacer(),
        const Text(
          'تم ارسال الطلب بنجاح',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Config.spaceMeduim,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              backgroundColor: Colors.green,
              fixedSize: Size(double.infinity, Config.blockSizeVertical! * 8)),
          onPressed: () => Get.back(),
          child: const Text(
            'العودة الى الصفحة الرئيسية',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ),
        Config.spaceMeduim
      ],
    );
  }
}
