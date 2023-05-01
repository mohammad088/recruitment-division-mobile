import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/controllers/areas_controller.dart';

import '../components/admin_home_page_drawer.dart';
import '../components/custom_app_bar.dart';
import '../utils/config.dart';

class AllAreasPage extends StatelessWidget {
  AllAreasPage({super.key});
  final controller = Get.put(AreasController());

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return controller.initialized
        ? Scaffold(
            appBar: const CustomAppBar(),
            drawer: const AdminHomePageDrawer(),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: Config.screenHeight! * 0.15,
                    child: const Center(
                        child: Text(
                      'المناطق',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                GetBuilder(
                    init: AreasController(),
                    builder: (controller) {
                      return SliverGrid.count(
                        crossAxisSpacing: Config.screenWidth! * 0.009,
                        mainAxisSpacing: Config.screenWidth! * 0.02,
                        crossAxisCount: 2,
                        children: controller.areas.map((item) {
                          return GestureDetector(
                            onTap: () {},
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                   Expanded(
                                      flex: 5,
                                      child: SizedBox(
                                        child: Center(
                                            child: Text(item.name ?? '')),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 3, right: 9),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    bottom:
                                                        Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: const [
                                            Text(
                                              'عدد المناطق :',
                                              textDirection: TextDirection.rtl,
                                            ),
                                            Text(
                                              'عدد السكان :',
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
              ],
            ))
        : CircularProgressIndicator();
  }
}
