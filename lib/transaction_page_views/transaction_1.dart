import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recruitment_division_automation/controllers/page_view_controller.dart';
import 'package:recruitment_division_automation/utils/config.dart';
import '../components/bottom_transaction.dart';
import '../components/text_field_transaction.dart';

class Transaction1 extends StatelessWidget {
  Transaction1({super.key});
  final c = Get.put(PageviewController());
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'الاسم الاول',
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    GetBuilder(
                        init: PageviewController(),
                        builder: (c) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFieldTransaction(
                                  inputDecoration: InputDecoration(
                                    focusedBorder: c.firstNameerror
                                        ? Config.focusBorder
                                        : Config.errorBorder,
                                    enabledBorder: c.firstNameerror
                                        ? Config.outlinedBorder
                                        : Config.errorBorder,
                                  ),
                                  onchange: () {
                                    if (!c.firstNameController.text.contains(
                                            RegExp(r'^[\u0621-\u064A]+$')) &&
                                        c.firstNameController.text != '') {
                                      c.firstNameerror = false;
                                      c.update();
                                    } else {
                                      c.firstNameerror = true;
                                      c.update();
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  controller: c.firstNameController),
                              c.firstNameerror
                                  ? const SizedBox()
                                  : const Text(
                                      'الرجاء ادخال احرف عربية فقط و دون فراغات',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.normal),
                                      textDirection: TextDirection.rtl,
                                    )
                            ],
                          );
                        }),
                    const Text(
                      'اسم العائلة',
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    GetBuilder(
                        init: PageviewController(),
                        builder: (c) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFieldTransaction(
                                  inputDecoration: InputDecoration(
                                    focusedBorder: c.lastNameerror
                                        ? Config.focusBorder
                                        : Config.errorBorder,
                                    enabledBorder: c.lastNameerror
                                        ? Config.outlinedBorder
                                        : Config.errorBorder,
                                  ),
                                  onchange: () {
                                    if (!c.lastNameController.text.contains(
                                            RegExp(r'^[\u0621-\u064A]+$')) &&
                                        c.lastNameController.text != '') {
                                      c.lastNameerror = false;
                                      c.update();
                                    } else {
                                      c.lastNameerror = true;
                                      c.update();
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  controller: c.lastNameController),
                              c.lastNameerror
                                  ? const SizedBox()
                                  : const Text(
                                      'الرجاء ادخال احرف عربية فقط و دون فراغات',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.normal),
                                      textDirection: TextDirection.rtl,
                                    )
                            ],
                          );
                        }),
                    const Text(
                      'اسم الاب',
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    GetBuilder(
                        init: PageviewController(),
                        builder: (c) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFieldTransaction(
                                  inputDecoration: InputDecoration(
                                    focusedBorder: c.fatherNameerror
                                        ? Config.focusBorder
                                        : Config.errorBorder,
                                    enabledBorder: c.fatherNameerror
                                        ? Config.outlinedBorder
                                        : Config.errorBorder,
                                  ),
                                  onchange: () {
                                    if (!c.fatherNameController.text.contains(
                                            RegExp(r'^[\u0621-\u064A]+$')) &&
                                        c.fatherNameController.text != '') {
                                      c.fatherNameerror = false;
                                      c.update();
                                    } else {
                                      c.fatherNameerror = true;
                                      c.update();
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  controller: c.fatherNameController),
                              c.fatherNameerror
                                  ? const SizedBox()
                                  : const Text(
                                      'الرجاء ادخال احرف عربية فقط و دون فراغات',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.normal),
                                      textDirection: TextDirection.rtl,
                                    )
                            ],
                          );
                        }),
                    const Text(
                      'اسم الام',
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    GetBuilder(
                        init: PageviewController(),
                        builder: (c) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFieldTransaction(
                                  inputDecoration: InputDecoration(
                                    focusedBorder: c.motherNameerror
                                        ? Config.focusBorder
                                        : Config.errorBorder,
                                    enabledBorder: c.motherNameerror
                                        ? Config.outlinedBorder
                                        : Config.errorBorder,
                                  ),
                                  onchange: () {
                                    if (!c.motherNameController.text.contains(
                                            RegExp(r'^[\u0621-\u064A]+$')) &&
                                        c.motherNameController.text != '') {
                                      c.motherNameerror = false;
                                      c.update();
                                    } else {
                                      c.motherNameerror = true;
                                      c.update();
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  controller: c.motherNameController),
                              c.motherNameerror
                                  ? const SizedBox()
                                  : const Text(
                                      'الرجاء ادخال احرف عربية فقط و دون فراغات',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.normal),
                                      textDirection: TextDirection.rtl,
                                    )
                            ],
                          );
                        }),
                    SizedBox(
                      height: Config.blockSizeVertical! * 20,
                    )
                  ])),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LinearPercentIndicator(
                linearGradient:
                    const LinearGradient(colors: [Colors.orange, Colors.green]),
                barRadius: const Radius.circular(25),
                lineHeight: Config.safeBlockVertical! * 5,
                center: const Text('0%'),
                percent: 0.0,
              ),
              SizedBox(
                height: Config.screenHeight! * 0.01,
              ),
              BottomTranaction(
                onPressed: () {
                  if (c.firstNameerror &&
                      c.lastNameerror &&
                      c.fatherNameerror &&
                      c.motherNameerror &&
                      c.firstNameController.text != '' &&
                      c.lastNameController.text != '' &&
                      c.fatherNameController.text != '' &&
                      c.motherNameController.text != '') {
                    c.controller.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  } else {
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
                              const Text(
                                'الرجاء تعبئة الحقول ببيانات صحيحة',
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                              Config.spaceSmall,
                              SizedBox(
                                width: Config.screenWidth! * 0.3,
                                height: Config.screenHeight! * 0.06,
                                child: ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                    ),
                                    onPressed: () => Get.back(),
                                    child: const Text('حسنا')),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
                  }
                },
                onBackPressed: () => Get.back(),
              )
            ],
          ),
        )
      ],
    );
  }
}
