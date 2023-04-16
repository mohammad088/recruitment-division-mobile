import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/components/custom_app_bar.dart';
import '../controllers/table_controller.dart';
import '../utils/config.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return GetBuilder(
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
                                          initialScrollOffset: 1000,
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          const DataColumn(label: Text(''))
                                        ],
                                        source: MyData()),
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
  final controller = Get.put(TableController(), permanent: true);
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
          controller.filteredData[index][''] =
              !controller.filteredData[index][''];
          controller.update();
        },
        selected: controller.filteredData[index][''],
        cells: [
          DataCell(Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child: const Text('حذف')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('تعديل'),
              ),
            ],
          )),
          DataCell(Text(item['البطاقة 2'].toString())),
          DataCell(Text(item['البطاقة'].toString())),
          DataCell(Text(item['صورة ملحقة'].toString())),
          DataCell(Text(item['صورة'].toString())),
          DataCell(Text(item['نوع المعاملة'].toString())),
          DataCell(Text(item['حالة التجنيد'].toString())),
          DataCell(Text(item['رقم الهاتف'].toString())),
          DataCell(Text(item['المنطقة'].toString())),
          DataCell(Text(item['المحافظة'].toString())),
          DataCell(Text(item['رقم القيد'].toString())),
          DataCell(Text(item['الرقم الوطني'].toString())),
          DataCell(Text(item['الأم'].toString())),
          DataCell(Text(item["الأب"].toString())),
          DataCell(Text(item["الاسم الأخير"].toString())),
          DataCell(Text(item['الاسم الأول'].toString())),
          DataCell(GetBuilder(
              init: TableController(),
              builder: (c) {
                return Checkbox(
                  onChanged: (value) {
                    c.data[index][''] = value!;
                    c.update();
                  },
                  value: c.data[index][''],
                );
              }))
        ]);
  }
}
