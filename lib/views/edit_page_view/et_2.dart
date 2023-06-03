import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../controllers/et_controller.dart';
import '/components/dialog.dart';
import '/components/bottom_transaction.dart';
import '/components/numbers_text_field.dart';
import '/utils/config.dart';

class Et2 extends StatelessWidget {
  Et2({super.key});
  final c = Get.put(EtController());
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
                    GetBuilder(
                        init: EtController(),
                        builder: (c) {
                          return Column(
                            children: [
                              DropdownButtonFormField(
                                hint: const SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    'المحافظة',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                isDense: false,
                                value: c.selectedGovernorates.toString(),
                                menuMaxHeight: Config.screenHeight! * 0.3,
                                isExpanded: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.grey))),
                                focusColor: Colors.green,
                                style: const TextStyle(color: Colors.brown),
                                items: c.governorates.map((item) {
                                  return DropdownMenuItem<String>(
                                    alignment: Alignment.center,
                                    value: item.id.toString(),
                                    child: Center(
                                      child: Text(
                                        item.name ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  c.selectedGovernorates = int.parse(item!);
                                  c.getAllProvinceRegions(
                                      c.token, c.selectedGovernorates);
                                },
                              ),
                              Config.spaceMeduim,
                              DropdownButtonFormField(
                                hint: const SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    'المنطقة',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                isDense: false,
                                value: c.proAreas.first.id.toString(),
                                menuMaxHeight: Config.screenHeight! * 0.3,
                                isExpanded: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.grey))),
                                focusColor: Colors.green,
                                style: const TextStyle(color: Colors.brown),
                                items: c.proAreas.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.id.toString(),
                                    child: Center(
                                      child: Text(
                                        item.name ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  c.selectedArea = int.parse(item!);
                                },
                              )
                            ],
                          );
                        }),
                    Config.spaceMeduim,
                    GetBuilder(
                        init: EtController(),
                        builder: (c) {
                          return Column(
                            children: [
                              NumbersTextField(
                                inputDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: c.numberLengthError
                                      ? Config.errorBorder
                                      : Config.focusBorder,
                                  enabledBorder: Config.outlinedBorder,
                                ),
                                onChanged: () {
                                  if (c.phoneNumberController.text.length <
                                      10) {
                                    c.numberLengthError = true;
                                    c.update();
                                  } else {
                                    c.numberLengthError = false;
                                    c.update();
                                  }
                                },
                                maxLength: 10,
                                textInputType: TextInputType.phone,
                                controller: c.phoneNumberController,
                                hint: 'ادخل رقم الهاتف',
                              ),
                              c.numberLengthError
                                  ? const Text(
                                      'الرجاء ادخال 10 ارقام',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : const SizedBox()
                            ],
                          );
                        }),
                    GetBuilder(
                        init: EtController(),
                        builder: (c) {
                          return NumbersTextField(
                            hint: 'ادخل الرقم الوطني',
                            maxLength: 13,
                            textInputType: TextInputType.number,
                            controller: c.nationalNumberController,
                            onChanged: () {
                              if (c.nationalNumberController.text.length < 11) {
                                c.nationalNumberError = true;
                                c.update();
                              } else {
                                c.nationalNumberError = false;
                                c.update();
                              }
                            },
                            inputDecoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: c.nationalNumberError
                                    ? Config.errorBorder
                                    : Config.focusBorder,
                                enabledBorder: Config.outlinedBorder),
                          );
                        }),
                    NumbersTextField(
                        hint: 'رقم القيد',
                        maxLength: 6,
                        textInputType: TextInputType.number,
                        controller: c.restrictionNumberController,
                        onChanged: () {},
                        inputDecoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'رقم القيد',
                            hintTextDirection: TextDirection.rtl)),
                    Config.spaceMeduim,
                    GetBuilder(
                        init: EtController(),
                        builder: (c) {
                          return DropdownButtonFormField(
                            value: c.selectedStatus,
                            hint: const SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                'حالة التجنيد',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            isDense: false,
                            menuMaxHeight: Config.screenHeight! * 0.3,
                            isExpanded: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey))),
                            focusColor: Colors.green,
                            style: const TextStyle(color: Colors.brown),
                            items: c.enlistmentStatus.map((item) {
                              return DropdownMenuItem<String>(
                                value: item.id.toString(),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    item.name.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (item) {
                              c.selectedStatus = item!;
                              c.update();
                            },
                          );
                        }),
                    Config.spaceMeduim,
                    GetBuilder(
                        init: EtController(),
                        builder: (c) {
                          return DropdownButtonFormField(
                            value: c.selectedTransactionType,
                            hint: const SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                'نوع المعاملة',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            isDense: false,
                            menuMaxHeight: Config.screenHeight! * 0.3,
                            isExpanded: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey))),
                            focusColor: Colors.green,
                            style: const TextStyle(color: Colors.brown),
                            items: c.transactionType.map((item) {
                              return DropdownMenuItem<String>(
                                value: item.id.toString(),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    item.type ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (item) {
                              c.selectedTransactionType = item!;
                              c.update();
                            },
                          );
                        }),
                    Config.spaceMeduim,
                    TextField(
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                          hintText: 'اكتب ملاحظاتك',
                          hintTextDirection: TextDirection.rtl,
                          fillColor: Colors.white,
                          filled: true),
                      keyboardType: TextInputType.text,
                      controller: c.notesController,
                      maxLines: 4,
                    ),
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
                animation: true,
                linearGradient:
                    const LinearGradient(colors: [Colors.orange, Colors.green]),
                animationDuration: 1000,
                barRadius: const Radius.circular(25),
                lineHeight: Config.safeBlockVertical! * 5,
                center: const Text('35%'),
                percent: 0.35,
              ),
              SizedBox(
                height: Config.screenHeight! * 0.01,
              ),
              BottomTranaction(
                onPressed: () {
                  if (c.nationalNumberController.text.length < 8) {
                    dialog('الرجاء تعبئة الحقول ببيانات صحيحة');
                  } else if (c.phoneNumberController.text.length != 10) {
                    dialog('الرجاء تعبئة الحقول ببيانات صحيحة');
                  } else if (c.restrictionNumberController.text.isEmpty) {
                    dialog('الرجاء تعبئة الحقول ببيانات صحيحة');
                  } else if (c.selectedStatus.isEmpty) {
                    dialog('الرجاء تعبئة الحقول ببيانات صحيحة');
                  } else if (c.selectedTransactionType.isEmpty) {
                    dialog('الرجاء تعبئة الحقول ببيانات صحيحة');
                  } else if (c.notesController.text.isEmpty) {
                    dialog('الرجاء تعبئة الحقول ببيانات صحيحة');
                  } else {
                    c.controller.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                onBackPressed: () => c.controller.animateToPage(0,
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
