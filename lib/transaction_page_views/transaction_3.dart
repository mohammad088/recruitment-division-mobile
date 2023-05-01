import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recruitment_division_automation/controllers/page_view_controller.dart';
import 'package:recruitment_division_automation/utils/config.dart';
import '../components/bottom_transaction.dart';
import '../components/dialog.dart';
import '../components/image_box.dart';

class Transaction3 extends StatelessWidget {
  Transaction3({super.key});

  final c = Get.put(PageviewController());

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GetBuilder(
                      init: PageviewController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.specialImage.path != ''
                                ? Image.file(c.specialImage)
                                : const Center(
                                    child: Text('ادخل صورة خاصة بك')),
                            onPressed: () async {
                              c.specialImage =
                                  await c.uploadImage(c.specialImage);
                            });
                      }),
                  Config.spaceMeduim,
                  GetBuilder(
                      init: PageviewController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.frontIdImage.path != ''
                                ? Image.file(c.frontIdImage)
                                : const Center(
                                    child: Text('صورة امامية للهوية الشخصية')),
                            onPressed: () async {
                              c.frontIdImage =
                                  await c.uploadImage(c.frontIdImage);
                            });
                      }),
                  Config.spaceMeduim,
                  GetBuilder(
                      init: PageviewController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.backIdImage.path != ''
                                ? Image.file(c.backIdImage)
                                : const Center(
                                    child: Text('صورة خلفية للهوية الشخصية')),
                            onPressed: () async {
                              c.backIdImage =
                                  await c.uploadImage(c.backIdImage);
                            });
                      }),
                  Config.spaceMeduim,
                  GetBuilder(
                      init: PageviewController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.anotherImage.path != ''
                                ? Image.file(c.anotherImage)
                                : const Center(child: Text('صورة ملحقة')),
                            onPressed: () async {
                              c.anotherImage =
                                  await c.uploadImage(c.anotherImage);
                            });
                      }),
                  Config.spaceMeduim,
                  SizedBox(
                    height: Config.blockSizeVertical! * 20,
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LinearPercentIndicator(
                animation: true,
                linearGradient:
                    const LinearGradient(colors: [Colors.orange, Colors.green]),
                animationDuration: 1000,
                barRadius: const Radius.circular(25),
                lineHeight: Config.safeBlockVertical! * 5,
                center: const Text('75%'),
                percent: 0.75,
              ),
              SizedBox(
                height: Config.screenHeight! * 0.01,
              ),
              BottomTranaction(
                onPressed: () {
                  if (c.specialImage.path != '' &&
                      c.backIdImage.path != '' &&
                      c.frontIdImage.path != '' &&
                      c.anotherImage.path != '') {
                    c.controller.animateToPage(3,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  } else {
                    dialog('الرجاء تعبئة الحقول ببيانات صحيحة');
                  }
                },
                onBackPressed: () => c.controller.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn),
              )
            ],
          ),
        )
      ],
    );
  }
}
