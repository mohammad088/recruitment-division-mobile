import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/admin_home_page_drawer.dart';
import '../controllers/governates_areas_controller.dart';
import '../components/custom_app_bar.dart';
import '../utils/config.dart';

class GovernoratesPage extends StatelessWidget {
  const GovernoratesPage({super.key});
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
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
                  'المحافظات',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            GetBuilder(
              init: GovernatesAreasController(),
              builder: (controller) {
                return SliverGrid.count(
                  crossAxisSpacing: Config.screenWidth! * 0.009,
                  mainAxisSpacing: Config.screenWidth! * 0.02,
                  crossAxisCount: 2,
                  children: controller.Apigovernorates.map((item) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedGovernorate = item.name!;
                        Get.toNamed('/areaspage');
                      },
                      child: Card(
                        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 5,
                                child: SizedBox(
                                  child: Center(child: Text(item.name)),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.only(top: 3, right: 9),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(20))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
              }
            ),
          ],
        ));
  }
}
