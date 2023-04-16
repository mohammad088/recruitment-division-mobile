import 'dart:convert';

import 'package:enough_convert/enough_convert.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TableController extends GetxController {
  void loadCSV() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    List<List<dynamic>> rows = [];
    List<dynamic> row = [];
    row.add('الاسم الأول');
    rows.add(row);
    for (int i = 0; i < filteredData.length; i++) {
      List<dynamic> row = [];
      row.add(filteredData[i]['الاسم الأول']);
      rows.add(row);
    }
    String csv = const ListToCsvConverter().convert(rows);
    Directory? dir = await getApplicationDocumentsDirectory();
    String file = '/storage/emulated/0/Download';
    File f = File("$file/filename.csv");
    f.writeAsString(csv, mode: FileMode.read);
  }

  void onChange(String text) {
    filteredData = text.isEmpty
        ? data
        : data
            .where((item) =>
                item['الاسم الأول'].toLowerCase().contains(text.toLowerCase()))
            .toList();
    update();
  }

  bool sort = true;
  // ignore: prefer_typing_uninitialized_variables
  List<Map<String, dynamic>> filteredData = [{}];
  assertColumn(int columnIndex, bool asceding) {
    if (columnIndex == 15) {
      if (asceding) {
        filteredData.sort(
          (a, b) => a['الاسم الأول'].compareTo(b['الاسم الأول']),
        );
      } else {
        filteredData.sort(
          (a, b) => b['الاسم الأول'].compareTo(a['الاسم الأول']),
        );
      }
    }
  }

  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    filteredData = data;
    super.onInit();
  }

  List<Map<String, dynamic>> data = [
    {
      'الاسم الأول': 'محمد',
      'الاسم الأخير': 'ديبو',
      'الأب': 'علي',
      'الأم': 'مياده',
      'الرقم الوطني': '123',
      'رقم القيد': '123',
      'المحافظة': 'حمص',
      'المنطقة': 'حمص',
      'رقم الهاتف': '123',
      'حالة التجنيد': 'معفى',
      'نوع المعاملة': 'تأجيل دراسي',
      'صورة': 'url',
      'صورة ملحقة': 'url',
      'البطاقة': 'url',
      'البطاقة 2': 'url',
      '': false
    },
    {
      'الاسم الأول': 'محمود',
      'الاسم الأخير': 'محمد',
      'الأب': 'تيسير',
      'الأم': 'حسنة',
      'الرقم الوطني': '123',
      'رقم القيد': '123',
      'المحافظة': 'حمص',
      'المنطقة': 'حمص',
      'رقم الهاتف': '123',
      'حالة التجنيد': 'معفى',
      'نوع المعاملة': 'تأجيل دراسي',
      'صورة': 'url',
      'صورة ملحقة': 'url',
      'البطاقة': 'url',
      'البطاقة 2': 'url',
      '': false
    },
    {
      'الاسم الأول': 'سامر',
      'الاسم الأخير': 'سمرة',
      'الأب': 'سام',
      'الأم': 'سميرة',
      'الرقم الوطني': '123',
      'رقم القيد': '123',
      'المحافظة': 'حمص',
      'المنطقة': 'حمص',
      'رقم الهاتف': '123',
      'حالة التجنيد': 'معفى',
      'نوع المعاملة': 'تأجيل دراسي',
      'صورة': 'url',
      'صورة ملحقة': 'url',
      'البطاقة': 'url',
      'البطاقة 2': 'url',
      '': false
    },
    {
      'الاسم الأول': 'جابر',
      'الاسم الأخير': 'عيود',
      'الأب': 'سمير',
      'الأم': 'مزنة',
      'الرقم الوطني': '123',
      'رقم القيد': '123',
      'المحافظة': 'حمص',
      'المنطقة': 'حمص',
      'رقم الهاتف': '123',
      'حالة التجنيد': 'معفى',
      'نوع المعاملة': 'تأجيل دراسي',
      'صورة': 'url',
      'صورة ملحقة': 'url',
      'البطاقة': 'url',
      'البطاقة 2': 'url',
      '': false
    },
    {
      'الاسم الأول': 'عبدالله',
      'الاسم الأخير': 'محمد',
      'الأب': 'يوسف',
      'الأم': 'يسرى',
      'الرقم الوطني': '123',
      'رقم القيد': '123',
      'المحافظة': 'حمص',
      'المنطقة': 'حمص',
      'رقم الهاتف': '123',
      'حالة التجنيد': 'معفى',
      'نوع المعاملة': 'تأجيل دراسي',
      'صورة': 'url',
      'صورة ملحقة': 'url',
      'البطاقة': 'url',
      'البطاقة 2': 'url',
      '': false
    },
    {
      'الاسم الأول': 'كامل',
      'الاسم الأخير': 'حسن',
      'الأب': 'محمد',
      'الأم': 'لينا',
      'الرقم الوطني': '123',
      'رقم القيد': '123',
      'المحافظة': 'حمص',
      'المنطقة': 'حمص',
      'رقم الهاتف': '123',
      'حالة التجنيد': 'معفى',
      'نوع المعاملة': 'تأجيل دراسي',
      'صورة': 'url',
      'صورة ملحقة': 'url',
      'البطاقة': 'url',
      'البطاقة 2': 'url',
      '': false
    }
  ];
  bool isSelected = false;
  void onCheckboxChange(int index) {
    isSelected = !isSelected;
    update();
  }
}
