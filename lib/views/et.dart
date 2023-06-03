import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/admin_home_page_drawer.dart';
import '../components/custom_app_bar.dart';
import '../controllers/et_controller.dart';
import 'edit_page_view/et_1.dart';
import 'edit_page_view/et_2.dart';
import 'edit_page_view/et_3.dart';
import 'edit_page_view/et_4.dart';

class Et extends StatelessWidget {
  Et({super.key});
  final c = Get.put(EtController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AdminHomePageDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: c.controller,
        onPageChanged: (value) => c.onChange(value),
        children: <Widget>[Et1(), Et2(), Et3(), const Et4()],
      ),
    );
  }
}
