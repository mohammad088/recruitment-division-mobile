import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_app_bar.dart';
import '../controllers/user_info_controller.dart';
import '../utils/config.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final cont = Get.put(UserInfoController());
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return GetBuilder(
        id: 1,
        assignId: true,
        init: UserInfoController(),
        builder: (cont) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.only(
                      right: Config.screenWidth! * 0.1,
                      left: Config.screenWidth! * 0.1,
                      top: Config.screenHeight! * 0.05),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: Config.screenWidth! * 0.8,
                            child: SingleChildScrollView(
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    PaginatedDataTable(
                                      horizontalMargin: 0,
                                      showCheckboxColumn: false,
                                      columnSpacing: 1,
                                      controller: ScrollController(
                                        initialScrollOffset: 2000,
                                      ),
                                      rowsPerPage: 20,
                                      columns: cont.columns
                                          .map((element) {
                                            return DataColumn(
                                                label: Expanded(
                                                    child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 15),
                                              color: element.isNotEmpty
                                                  ? Colors.blue.shade900
                                                  : const Color.fromRGBO(
                                                      234, 233, 233, 1),
                                              child: Text(
                                                element,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )));
                                          })
                                          .toList()
                                          .reversed
                                          .toList(),
                                      source: MyData(),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}

class MyData extends DataTableSource {
  final controller = Get.find<UserInfoController>();
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => controller.data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final item = controller.data[index];
    return DataRow(cells: [
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                controller.deleteUserInfo(controller.token, item.id!);
                controller.update([1]);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
          const SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.orange,
              )),
        ],
      )),
      DataCell(Center(
        child: CachedNetworkImage(
          imageUrl: '${controller.link}/images/${item.image}',
          progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          ),
        ),
      )),
      DataCell(
          Center(child: Text(item.nationalIdentificationNumber.toString()))),
      DataCell(Center(child: Text(item.enlistmentStatue!.name.toString()))),
      DataCell(Center(child: Text(item.villageNumber.toString()))),
      DataCell(Center(child: Text(item.phone2.toString()))),
      DataCell(Center(child: Text(item.phone1.toString()))),
      DataCell(Center(child: Text(item.familyName.toString()))),
      DataCell(Center(child: Text(item.fatherName.toString()))),
      DataCell(Center(child: Text(item.motherName.toString()))),
      DataCell(Center(child: Text(item.user!.name.toString()))),
      DataCell(Center(child: Text((index + 1).toString()))),
    ]);
  }
}
