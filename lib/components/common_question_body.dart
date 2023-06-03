import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_new_question.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/common_question_controller.dart';
import '../utils/config.dart';

class CommonQuestionBody extends StatefulWidget {
  const CommonQuestionBody({super.key});

  @override
  State<CommonQuestionBody> createState() => _CommonQuestionBodyState();
}

class _CommonQuestionBodyState extends State<CommonQuestionBody> {
  CommonQuestionController controller = Get.put(CommonQuestionController());
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return controller.initialized
        ? SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                color: Colors.white,
                width: Config.screenWidth! * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Config.spaceMeduim,
                    const Text(
                      'أسئلة واستفسارات',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 138, 102, 10)),
                    ),
                    Config.spaceMeduim,
                    GetBuilder(
                        init: CommonQuestionController(),
                        builder: (controller) {
                          return Visibility(
                            visible: controller.role > 1 ? true : false,
                            child: ListTile(
                              iconColor: Colors.black,
                              title: const Text(
                                'اضف سؤال جديد',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              trailing: const Icon(
                                Icons.edit_note_rounded,
                                size: 25,
                              ),
                              onTap: () {
                                questionDialog(
                                  () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    String token =
                                        prefs.getString('token') ?? '';
                                    controller
                                        .addNewQuestion(
                                            controller.questionController.text,
                                            controller.answerController.text,
                                            token)
                                        .then((_) => Get.back(
                                            // closeOverlays: true,
                                            ));
                                    // controller.GetBuilderkey.currentState!.activate();
                                    // Get.back();
                                  },
                                );
                              },
                            ),
                          );
                        }),
                    GetBuilder(
                        key: controller.GetBuilderkey,
                        init: CommonQuestionController(),
                        builder: (controller) {
                          return ExpansionPanelList(
                              expansionCallback: (int index, bool isExpanded) {
                                controller.changeExpantion(index);
                              },
                              children: controller.questions
                                  .map<ExpansionPanel>((Question question) {
                                return ExpansionPanel(
                                    backgroundColor: question.isExpanded
                                        ? Colors.green
                                        : Colors.white,
                                    headerBuilder: (ctx, bool isExpanded) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: controller.role > 1
                                                    ? true
                                                    : false,
                                                child: IconButton(
                                                    onPressed: () async {
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      String token =
                                                          prefs.getString(
                                                                  'token') ??
                                                              '';
                                                      await controller
                                                          .deleteQuestion(
                                                              token,
                                                              question
                                                                  .data.id!);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      size: 13,
                                                      color: Colors.red,
                                                    )),
                                              ),
                                              Visibility(
                                                visible: controller.role > 1
                                                    ? true
                                                    : false,
                                                child: IconButton(
                                                    onPressed: () {
                                                      questionDialog(() async {
                                                        SharedPreferences
                                                            prefs =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        String token =
                                                            prefs.getString(
                                                                    'token') ??
                                                                '';
                                                        await controller
                                                            .updateQuestionAndAnswer(
                                                                controller
                                                                    .questionController
                                                                    .text,
                                                                controller
                                                                    .answerController
                                                                    .text,
                                                                token,
                                                                question
                                                                    .data.id!);
                                                        controller.GetBuilderkey
                                                            .currentState!
                                                            .activate();
                                                        Get.back();
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      size: 13,
                                                      color: Color.fromARGB(
                                                          255, 138, 102, 10),
                                                    )),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 2,
                                                    bottom: 25,
                                                    top: 25),
                                                child: SizedBox(
                                                  width:
                                                      Config.screenWidth! * 0.3,
                                                  child: Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    question.data.question ??
                                                        '',
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                    body: Container(
                                      width: Config.screenWidth! * 0.8,
                                      color: Colors.white,
                                      padding: const EdgeInsets.only(
                                          bottom: 15, top: 10),
                                      child: Text(
                                        question.data.answer ?? '',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    isExpanded: question.isExpanded);
                              }).toList());
                        }),
                  ],
                ),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
  }
}
