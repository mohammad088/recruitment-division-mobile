import 'dart:io';
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recruitment_division_automation/components/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/transastions.dart';

class TableController extends GetxController {
  GlobalKey tableKey = GlobalKey();
  String link = 'http://10.0.2.2:8000';
  late Transactions transactionTable;
  late SharedPreferences prefs;
  String token = '';
  bool selected = false;

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
      row.add(filteredData[i].name);
      rows.add(row);
    }
    String csv = const ListToCsvConverter().convert(rows);
    Directory? dir = await getApplicationDocumentsDirectory();
    String file = '/storage/emulated/0/Download';
    File f = File("$file/filename.csv");
    f.writeAsString(csv, mode: FileMode.read);
  }

  void onChange(String text) {
    if (text.isEmpty) {
      filteredData = transactionTable.data!;
    } else {
      filteredData = transactionTable.data!
          .where((item) =>
              item.name.toString().toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    update([1]);
  }

  bool sort = true;
  // ignore: prefer_typing_uninitialized_variables
  List<Data> filteredData = [];

  assertColumn(int columnIndex, bool asceding) {
    if (columnIndex == 15) {
      if (asceding) {
        filteredData.sort(
          (a, b) => a.name.toString().compareTo(b.name.toString()),
        );
      } else {
        filteredData.sort(
          (a, b) => b.name.toString().compareTo(a.name.toString()),
        );
      }
    }
  }

  TextEditingController searchController = TextEditingController();
  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    await getAllTransactions(token);
    filteredData = transactionTable.data ?? [];
    super.onInit();
  }

  Future<dynamic> getAllTransactions(String token) async {
    try {
      final response = await Dio().get('$link/api/transactions',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
          ),
          data: {'token': token});
      if (response.statusCode == 200 && response.data != '') {
        transactionTable = Transactions.fromJson(response.data);

        update([1]);
      }
    } catch (error) {
      error.printError();
      dialog('هنالك خطأ');
    }
  }

  Future<dynamic> updateTransaction(Data data, int id, String token) async {
    try {
      final response = await Dio().post('$link/api/transaction/update/$id',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
          ),
          data: {
            'name': data.name,
            'user_id': data.userId,
            'notes': data.notes,
            'provinces_consent': data.provincesConsent,
            'region_consent': data.regionConsent,
            'province_id': data.provinceId,
            'region_id': data.regionId,
            'user_image': data.userImage,
            'mother_name': data.motherName,
            'father_name': data.fatherName,
            'family_name': data.familyName,
            'phone1': data.phone1,
            'village_number': data.villageNumber,
            'national_identification_number': data.nationalIdentificationNumber,
            'front_face_of_identity': data.frontFaceOfIdentity,
            'back_face_of_identity': data.backFaceOfIdentity,
            'attached_image': data.attachedImage,
            'transactiontype_id': data.transactiontypeId,
            'token': token
          });
      if (response.statusCode == 200 && response.data != '') {
        transactionTable = Transactions.fromJson(response.data);
        update();
      }
    } catch (error) {
      dialog('هنالك خطأ');
    }
  }

  Future<dynamic> deleteTransacrion(String token, int id) async {
    try {
      final response = await Dio().post('$link/api/transaction/delete/$id',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
          ),
          data: {'token': token});
      if (response.statusCode == 200) {
        transactionTable.data!.removeWhere((element) => element.id == id);
        update([1]);
      }
    } catch (error) {
      error.printError();
      dialog('هنالك خطأ');
      update();
    }
  }

  bool isSelected = false;
  void onCheckboxChange(int index) {
    isSelected = !isSelected;
    update([1]);
  }
}
