import 'package:flutter/material.dart';

import '../utils/config.dart';

class CommonQuestionBody extends StatefulWidget {
  const CommonQuestionBody({super.key});

  @override
  State<CommonQuestionBody> createState() => _CommonQuestionBodyState();
}

class _CommonQuestionBodyState extends State<CommonQuestionBody> {
  List<Questions> questionsList = [
    Questions(
        title: 'كيف استطيع الحصول على مصدقة تأجيل',
        content: 'تسطيع الحصول عليها من خلال مراجعة شؤون الكلية'),
    Questions(title: 'aaaaa', content: 'dddddddddddd'),
    Questions(title: 'aaaaa', content: 'dddddddddddd'),
    Questions(title: 'aaaaa', content: 'dddddddddddd'),
    Questions(title: 'aaaaa', content: 'dddddddddddd'),
    Questions(title: 'aaaaa', content: 'dddddddddddd'),
    Questions(title: 'aaaaa', content: 'dddddddddddd'),
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SingleChildScrollView(
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
              ListTile(
                iconColor: Colors.black,
                title: const Text(
                  'اضف سؤال جديد',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                trailing: const Icon(
                  Icons.edit_note_rounded,
                  size: 25,
                ),
                onTap: () {},
              ),
              ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      questionsList[index].isExpanded = !isExpanded;
                    });
                  },
                  children:
                      questionsList.map<ExpansionPanel>((Questions questions) {
                    return ExpansionPanel(
                        backgroundColor:
                            questions.isExpanded ? Colors.green : Colors.white,
                        headerBuilder: (ctx, bool isExpanded) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 13,
                                        color: Colors.red,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 13,
                                        color:
                                            Color.fromARGB(255, 138, 102, 10),
                                      )),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 2, bottom: 25, top: 25),
                                    child: SizedBox(
                                      width: Config.screenWidth! * 0.3,
                                      child: Text(
                                        textDirection: TextDirection.rtl,
                                        questions.title,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
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
                          padding: const EdgeInsets.only(bottom: 15, top: 10),
                          child: Text(
                            questions.content,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        isExpanded: questions.isExpanded);
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}

class Questions {
  final String title;
  final String content;
  bool isExpanded = false;

  Questions({required this.title, required this.content});
}
