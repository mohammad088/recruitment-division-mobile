import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_app_bar.dart';
import '../controllers/table_controller.dart';
import '../utils/config.dart';
import 'et.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final cont = Get.put(TableController());
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return GetBuilder(
        id: 1,
        assignId: true,
        init: TableController(),
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
                          width: 150,
                          height: 50,
                          child: TextField(
                            onChanged: (value) {
                              cont.onChange(value);
                            },
                            onTap: () {
                              if (cont.searchController.selection ==
                                  TextSelection.fromPosition(TextPosition(
                                      offset:
                                          cont.searchController.text.length -
                                              1))) {
                                cont.searchController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            cont.searchController.text.length));
                                cont.update();
                              }
                            },
                            textDirection: TextDirection.rtl,
                            controller: cont.searchController,
                            cursorColor: Colors.green,
                            decoration: const InputDecoration(
                                filled: true,
                                alignLabelWithHint: true,
                                fillColor: Colors.white,
                                hintTextDirection: TextDirection.rtl,
                                hintText: 'بحث',
                                hintStyle: TextStyle(fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.grey,
                                ))),
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            width: Config.screenWidth! * 0.8,
                            child: SingleChildScrollView(
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    PaginatedDataTable(
                                      header: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                cont.loadCSV();
                                              },
                                              child: const Text('load CSV')),
                                          const Text(
                                            'كافة المعاملات',
                                            style: TextStyle(fontSize: 20),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                      sortAscending: cont.sort,
                                      sortColumnIndex: 15,
                                      showCheckboxColumn: false,
                                      columnSpacing: 20,
                                      showFirstLastButtons: true,
                                      controller: ScrollController(
                                        initialScrollOffset: 2000,
                                      ),
                                      rowsPerPage: 30,
                                      columns: [
                                        const DataColumn(label: Text('')),
                                        const DataColumn(
                                            label: Text('البطاقة 2',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('البطاقة',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('صورة ملحقة',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('صورة',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('نوع المعاملة',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('حالة التجنيد',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('رقم الهاتف',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('المنطقة',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('المحافظة',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('رقم القيد',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('الرقم الوطني',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('الأم',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                            label: Text('الأب',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const DataColumn(
                                          label: Text(
                                            'الاسم الأخير',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataColumn(
                                            onSort: (columnIndex, ascending) {
                                              cont.sort = !cont.sort;
                                              cont.assertColumn(
                                                  columnIndex, ascending);
                                              cont.update();
                                            },
                                            label: const Text(
                                              'الاسم الأول',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const DataColumn(label: Text(''))
                                      ],
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
  final controller = Get.find<TableController>();
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => controller.filteredData.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final item = controller.filteredData[index];
    return DataRow(
        onSelectChanged: (value) {
          controller.selected = value ?? false;
          controller.update();
        },
        selected: controller.selected,
        cells: [
          DataCell(Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    controller.deleteTransacrion(
                        controller.token, controller.filteredData[index].id!);
                    controller.update([1]);
                  },
                  child: const Text('حذف')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.off(() => Et(), arguments: [
                    item.name,
                    item.familyName,
                    item.fatherName,
                    item.motherName,
                    item.provinceId,
                    item.regionId,
                    item.region!.name,
                    item.phone1,
                    item.nationalIdentificationNumber,
                    item.notes,
                    item.villageNumber,
                    item.enlistmentStatueId,
                    item.transactiontypeId,
                    item.attachedImage,
                    item.userImage,
                    item.frontFaceOfIdentity,
                    item.backFaceOfIdentity,
                    item.id.toString()
                  ]);
                },
                child: const Text('تعديل'),
              ),
            ],
          )),
          DataCell(SizedBox(
              width: Config.blockSizeHorizontal! * 10,
              height: Config.blockSizeVertical! * 10,
              child: CachedNetworkImage(
                imageUrl:
                    '${controller.link}/images/${item.backFaceOfIdentity}',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ))),
          DataCell(SizedBox(
              width: Config.blockSizeHorizontal! * 10,
              height: Config.blockSizeVertical! * 10,
              child: CachedNetworkImage(
                imageUrl:
                    '${controller.link}/images/${item.frontFaceOfIdentity}',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ))),
          DataCell(SizedBox(
              width: Config.blockSizeHorizontal! * 10,
              height: Config.blockSizeVertical! * 10,
              child: CachedNetworkImage(
                imageUrl: '${controller.link}/images/${item.attachedImage}',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ))),
          DataCell(SizedBox(
              width: Config.blockSizeHorizontal! * 10,
              height: Config.blockSizeVertical! * 10,
              child: CachedNetworkImage(
                imageUrl: '${controller.link}/images/${item.userImage}',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ))),
          DataCell(Text(item.transactiontype!.type.toString())),
          DataCell(Text(item.enlistmentStatue!.name.toString())),
          DataCell(Text(item.phone1.toString())),
          DataCell(Text(item.region!.name.toString())),
          DataCell(Text(item.province!.name.toString())),
          DataCell(Text(item.villageNumber.toString())),
          DataCell(Text(item.nationalIdentificationNumber.toString())),
          DataCell(Text(item.motherName.toString())),
          DataCell(Text(item.fatherName.toString())),
          DataCell(Text(item.familyName.toString())),
          DataCell(Text(item.name.toString())),
          DataCell(GetBuilder(
              init: TableController(),
              builder: (c) {
                return Checkbox(
                    onChanged: (value) {
                      c.selected = value ?? false;
                      c.update();
                    },
                    value: c.selected);
              }))
        ]);
  }
}
