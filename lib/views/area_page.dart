import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/components/admin_home_page_drawer.dart';
import 'package:recruitment_division_automation/components/custom_app_bar.dart';
import 'package:recruitment_division_automation/controllers/governates_areas_controller.dart';

import '../utils/config.dart';

class AreasPage extends GetView<GovernatesAreasController> {
  const AreasPage({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    Get.put(GovernatesAreasController());
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AdminHomePageDrawer(),
      body: controller.initialized
          ? CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: Config.screenHeight! * 0.15,
                    child: Center(
                        child: Text(
                      'مناطق ${controller.selectedGovernorate}',
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SliverGrid.count(
                  crossAxisSpacing: Config.screenWidth! * 0.009,
                  mainAxisSpacing: Config.screenWidth! * 0.02,
                  crossAxisCount:
                      controller.areas[controller.selectedGovernorate]!.length >
                              5
                          ? 2
                          : 1,
                  children: controller.areas[controller.selectedGovernorate]!
                      .map((item) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedArea = item;
                        Get.toNamed('/TransactionsPage');
                      },
                      child: Card(
                        margin:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 5,
                                child: SizedBox(
                                  child: Center(
                                      child: Text(
                                    '$item',
                                    style: TextStyle(
                                      fontSize: controller
                                                  .areas[controller
                                                      .selectedGovernorate]!
                                                  .length >
                                              5
                                          ? 20
                                          : 30,
                                    ),
                                  )),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(top: 3, right: 9),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(20))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'عدد المراكز :',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: controller
                                                      .areas[controller
                                                          .selectedGovernorate]!
                                                      .length >
                                                  5
                                              ? 14
                                              : 30,
                                        ),
                                      ),
                                      controller
                                                  .areas[controller
                                                      .selectedGovernorate]!
                                                  .length >
                                              5
                                          ? Container()
                                          : Config.spaceSmall,
                                      Text(
                                        'عدد المعاملات :',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: controller
                                                      .areas[controller
                                                          .selectedGovernorate]!
                                                      .length >
                                                  5
                                              ? 14
                                              : 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
