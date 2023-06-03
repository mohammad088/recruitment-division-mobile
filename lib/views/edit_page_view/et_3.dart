import 'dart:io';
import 'package:path/path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recruitment_division_automation/models/transaction_table.dart';

import '../../controllers/et_controller.dart';
import '/components/bottom_transaction.dart';
import '/components/dialog.dart';
import '/components/image_box.dart';
import '/utils/config.dart';

class Et3 extends StatelessWidget {
  Et3({super.key});

  final c = Get.put(EtController());

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
                      init: EtController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.specialImage.path != ''
                                ? Image.file(c.specialImage)
                                : Center(
                                    child: CachedNetworkImage(
                                        progressIndicatorBuilder: (context, url,
                                                progress) =>
                                            Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                        imageUrl:
                                            '${c.link}/images/${c.userImagePath}')),
                            onPressed: () async {
                              c.specialImage =
                                  await c.uploadImage(c.specialImage);
                            });
                      }),
                  Config.spaceMeduim,
                  GetBuilder(
                      init: EtController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.frontIdImage.path != ''
                                ? Image.file(c.frontIdImage)
                                : CachedNetworkImage(
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                    imageUrl:
                                        '${c.link}/images/${c.frontFaceOfIdentityPath}'),
                            onPressed: () async {
                              c.frontIdImage =
                                  await c.uploadImage(c.frontIdImage);
                            });
                      }),
                  Config.spaceMeduim,
                  GetBuilder(
                      init: EtController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.backIdImage.path != ''
                                ? Image.file(c.backIdImage)
                                : CachedNetworkImage(
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                    imageUrl:
                                        '${c.link}/images/${c.backFaceOfIdentityPath}'),
                            onPressed: () async {
                              c.backIdImage =
                                  await c.uploadImage(c.backIdImage);
                            });
                      }),
                  Config.spaceMeduim,
                  GetBuilder(
                      init: EtController(),
                      builder: (c) {
                        return ImageBox(
                            child: c.anotherImage.path != ''
                                ? Image.file(c.anotherImage)
                                : CachedNetworkImage(
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                    imageUrl:
                                        '${c.link}/images/${c.attachedImagePath}'),
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
                onPressed: () async {
                  if (c.anotherImage.path == '') {
                    c.anotherImage = await c.downloadFile(
                        '${c.link}/images/${c.attachedImagePath}');
                  }
                  if (c.backIdImage.path == '') {
                    c.backIdImage = await c.downloadFile(
                        '${c.link}/images/${c.backFaceOfIdentityPath}');
                  }
                  if (c.frontIdImage.path == '') {
                    c.frontIdImage = await c.downloadFile(
                        '${c.link}/images/${c.attachedImagePath}');
                  }
                  if (c.specialImage.path == '') {
                    c.specialImage = await c
                        .downloadFile('${c.link}/images/${c.userImagePath}');
                  }
                  c
                      .updateTransaction(
                          Data(
                            notes: c.notesController.text,
                            name: c.firstNameController.text,
                            fatherName: c.fatherNameController.text,
                            motherName: c.motherNameController.text,
                            familyName: c.lastNameController.text,
                            provinceId: c.selectedGovernorates,
                            regionId: c.selectedArea,
                            nationalIdentificationNumber:
                                int.parse(c.nationalNumberController.text),
                            villageNumber: c.restrictionNumberController.text,
                            phone1: int.parse(c.phoneNumberController.text),
                            enlistmentStatueId: int.parse(c.selectedStatus),
                            transactiontypeId:
                                int.parse(c.selectedTransactionType),
                            userImage: c.specialImage,
                            userId: c.prefs.getInt('user_id'),
                            frontFaceOfIdentity: c.frontIdImage,
                            backFaceOfIdentity: c.backIdImage,
                            attachedImage: c.anotherImage,
                          ),
                          c.prefs.getString('token')!,
                          c.transactionID)
                      .then((value) {
                    if (c.updateAccess) {
                      c.controller.animateToPage(3,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  });
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
