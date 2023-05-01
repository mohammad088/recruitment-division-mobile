import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/controllers/common_question_controller.dart';
import '../utils/config.dart';

void questionDialog(void Function()? onPressed) {
  CommonQuestionController controller = Get.find<CommonQuestionController>();
  Get.dialog(
    Center(
      child: Card(
        color: Colors.brown,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: SizedBox(
          width: Config.screenWidth! * 0.75,
          height: Config.screenHeight! * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'السؤال',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextField(
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white),
                  controller: controller.questionController,
                ),
                const Text(
                  'الجواب',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextField(
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white),
                  controller: controller.answerController,
                ),
                Config.spaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed:onPressed,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize:
                              Size.fromHeight(Config.blockSizeVertical! * 5)),
                      child: const Text('ادخال'),
                    )),
                    SizedBox(
                      width: Config.blockSizeHorizontal! * 6,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          fixedSize:
                              Size.fromHeight(Config.blockSizeVertical! * 5)),
                      child: const Text('الغاء'),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
