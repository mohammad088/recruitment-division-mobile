import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/dialog.dart';
import '../models/user_info_model.dart';

class UserInfoController extends GetxController {
  UserInfo userInfo = UserInfo();
  List<Data> data = [];
  late SharedPreferences prefs;
  late String token;
  String link = 'http://10.0.2.2:8000';
  List<String> columns = [
    'الرقم التسلسلي',
    'اسم المستخدم',
    'اسم الام',
    'اسم الاب',
    'اسم العائلة',
    'رقم الهاتف 1',
    'رقم الهاتف 2',
    'رقم القيد',
    'اسم العائلة',
    'الرقم الوطني',
    'الصورة الشخصية',
    ''
  ];

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    getUserInfo(token);
    super.onInit();
  }

  Future<dynamic> getUserInfo(String token) async {
    final GetConnect connect = GetConnect(timeout: const Duration(seconds: 10));
    try {
      final Response response = await connect.get('$link/api/usersinfo',
          query: {'token': token}, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 && response.body != '') {
        userInfo = UserInfo.fromJson(response.body);
        data = userInfo.data!;
        update([1]);
        return userInfo;
      }
    } catch (error) {
      error.printError();
      dialog('هنالك خطأ');
    }
  }

  Future<dynamic> deleteUserInfo(String token, int index) async {
    try {
      final response = await dio.Dio().post('$link/api/userinfo/delete/$index',
          options: dio.Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }),
          data: {'token': token});
      if (response.statusCode == 200 && response.data != '') {
        data.removeWhere((element) => element.id == index);
        update([1]);
      }
    } catch (error) {
      error.printError();
      dialog('هنالك خطأ');
    }
  }

  //final FormData formData = FormData({
  // 'image': MultipartFile(File(data.image!.path), filename: imageName),
  // 'mother_name': data.motherName,
  // 'father_name': data.fatherName,
  // 'family_name': data.familyName,
  // 'phone1': data.phone1,
  // 'phone2': data.phone2,
  // 'village_number': data.villageNumber,
  // 'enlistment_statue_id': data.enlistmentStatueId,
  // 'region_id': data.regionId,
  // 'national_identification_number': data.nationalIdentificationNumber,
  // 'user_id': data.userId,
  // 'token': token,
  //});
}
