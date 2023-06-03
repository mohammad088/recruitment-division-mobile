import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../components/dialog.dart';
import '../models/areas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AreasController extends GetxController {
  String link = 'http://10.0.2.2:8000';
  SharedPreferences? prefs;
  String token = '';
  AreasModel areasModel = AreasModel();
  List<Data> areas = [];
  @override
  void onInit() async {
    getToken().then((value) => getAllRegions(token));
    super.onInit();
  }

  Future<dynamic> getToken() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs!.getString('token') ?? '';
  }

  Future<dynamic> getAllRegions(String token) async {
    try {
      final response = await Dio().get('$link/api/regions',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }),
          data: {'token': token});
      if (response.statusCode == 200 && response.data != '') {
        areasModel = AreasModel.fromJson(response.data);
        areas = areasModel.data ?? [Data(id: 1, name: 'homs')];
        update();
      }
    } catch (error) {
      error.printError();
      dialog('خطأ بالاتصال بالشبكة');
    }
  }
}
