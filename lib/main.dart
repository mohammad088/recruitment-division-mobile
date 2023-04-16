import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/utils/themes.dart';
import 'package:recruitment_division_automation/views/admin_home_page.dart';
import 'package:recruitment_division_automation/views/common_question_page.dart';
import 'package:recruitment_division_automation/views/make_transaction.dart';
import 'package:recruitment_division_automation/views/transactions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.themeData,
      initialRoute: '/adminhomepage',
      getPages: [
        GetPage(name: '/adminhomepage', page: () => const AdminHomePage()),
        GetPage(
            name: '/commonquestions', page: () => const CommonQuestionPage()),
        GetPage(
            name: '/TransactionsPage', page: () => const TransactionsPage()),
        GetPage(name: '/maketransaction', page: () => MakeTransaction())
      ],
    );
  }
}
