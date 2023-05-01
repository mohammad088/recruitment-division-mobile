import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/components/admin_home_page_drawer.dart';
import 'package:recruitment_division_automation/components/custom_app_bar.dart';
import 'package:recruitment_division_automation/controllers/page_view_controller.dart';
import '../transaction_page_views/transaction_1.dart';
import '../transaction_page_views/transaction_2.dart';
import '../transaction_page_views/transaction_3.dart';
import '../transaction_page_views/transaction_4.dart';

class MakeTransaction extends StatelessWidget {
  MakeTransaction({super.key});
  final c = Get.put(PageviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AdminHomePageDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: c.controller,
        onPageChanged: (value) => c.onChange(value),
        children: <Widget>[
          Transaction1(),
          Transaction2(),
          Transaction3(),
          const Transaction4()
        ],
      ),
    );
  }
}
